//
//  MeetingDetailVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/08.
//

import UIKit
import RangeSeekSlider

class MeetingDetailVC: UIViewController {
    @IBOutlet weak var topTitleFirst: UILabel!
    @IBOutlet weak var topTitleSecond: UILabel!
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    public var scrollView: UIScrollView!
    public var collectionView: UICollectionView!
    public var viewModel: MeetingDetailViewModel!
    
    let rangeSlider = RangeSeekSlider()
    
    override func viewDidLoad() {
        // 스크롤 방지
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        setScrollView()
        viewModel = MeetingDetailViewModel(parent: scrollView, view: self.view)
        setCollectionView()
        dateCollectionView()
        viewModel.setUI()
        dateCollectionView()
        joinGenderCollectionView()
        countSlider()
        ageSlider()
        setButtonEvent()
    }
    
    private func setScrollView(){
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(132)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-49)
        }
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1018)
    }
    
    private func setCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: Int((UIScreen.main.bounds.width - 48) / 3), height: 28)
        layout.minimumLineSpacing = 24
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.tag = 0
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FilterCell.self, forCellWithReuseIdentifier: "MeetingFilterCell")
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(collectionView)
        collectionView.snp.makeConstraints { view in
            view.width.equalTo(UIScreen.main.bounds.width - 28)
            view.centerX.equalTo(self.view)
            view.height.equalTo(208)
            view.top.equalTo(52)
        }
    }
    // MARK:- 만남 날짜
    public func dateCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 39, height: 56)
        layout.minimumLineSpacing = 4
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.tag = 1
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MeetingDateCell.self, forCellWithReuseIdentifier: "MeetingDateCell")
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(collectionView)
        collectionView.snp.makeConstraints { view in
            view.width.equalTo(340)
            view.centerX.equalTo(self.view)
            view.height.equalTo(105)
            view.top.equalTo(296)
        }
    }
    
    // MARK:- 참가 가능 성별
    public func joinGenderCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: Int((UIScreen.main.bounds.width - 48) / 3), height: 28)
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.tag = 2
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FilterCell.self, forCellWithReuseIdentifier: "MeetingFilterCell")
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(collectionView)
        collectionView.snp.makeConstraints { view in
            view.width.equalTo(UIScreen.main.bounds.width - 32)
            view.centerX.equalTo(self.view)
            view.height.equalTo(28)
            view.top.equalTo(676)
        }
    }
    
    // MARK:- Slider
    let leading: CGFloat = 32
    let trailing: CGFloat = UIScreen.main.bounds.width - 32
    let backgroundBlue = UIView()
    let backgroundGray = UIView()
    public func countSlider(){
        singleSlider(top: 808)
    }
    
    public func ageSlider(){
        scrollView.addSubview(rangeSlider)
        rangeSlider.snp.makeConstraints { slider in
            slider.top.equalTo(941)
            slider.leading.equalTo(18)
            slider.height.equalTo(28)
            slider.width.equalTo(UIScreen.main.bounds.width - 36)
        }
        rangeSlider.delegate = self
        rangeSlider.minValue = 20
        rangeSlider.maxValue = 50
        rangeSlider.selectedMinValue = 20
        rangeSlider.selectedMaxValue = 50
        rangeSlider.handleColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        rangeSlider.handleDiameter = 28.0
        rangeSlider.lineHeight = 4
        rangeSlider.tintColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        rangeSlider.colorBetweenHandles = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        rangeSlider.selectedHandleDiameterMultiplier = 1.0
        rangeSlider.hideLabels = true
    }
}
// MARK: - Slider Delegate
extension MeetingDetailVC: RangeSeekSliderDelegate {
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        viewModel.setMinAge(age: Int(minValue))
        viewModel.setMaxAge(age: Int(maxValue))
        if maxValue == rangeSlider.maxValue && Int(minValue) != Int(rangeSlider.maxValue){
            viewModel.setAgeDescription(string: "\(Int(minValue))세 ~ 무제한")
        }
        else if Int(maxValue) == Int(rangeSlider.maxValue) && Int(minValue) == Int(rangeSlider.maxValue){
            print("asd")
            viewModel.setAgeDescription(string: "무제한")
        }
        else{
            viewModel.setAgeDescription(string: "\(Int(minValue))세 ~ \(Int(maxValue))세")
        }
    }

    func didStartTouches(in slider: RangeSeekSlider) {
        print("did start touches")
    }

    func didEndTouches(in slider: RangeSeekSlider) {
        print("did end touches")
    }
}

extension MeetingDetailVC: UICollectionViewDelegate, UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{
            return viewModel.getFiltersCount()
        }
        else if collectionView.tag == 1{
            return 8
        }
        else if collectionView.tag == 2{
            return 3
        }
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // MARK: - first collectionView
        if collectionView.tag == 0{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeetingFilterCell", for: indexPath) as? FilterCell {
                for v in cell.subviews{
                    v.removeFromSuperview()
                }
                
                let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.width, height: 28))
                cell.addSubview(title)
                cell.setupCell(color: .white)
                if viewModel.getClicked() == indexPath.row{
                    title.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    title.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
                }
                else{
                    title.textColor = #colorLiteral(red: 0.4520480633, green: 0.4520593286, blue: 0.4520532489, alpha: 1)
                    title.backgroundColor = #colorLiteral(red: 0.9625374675, green: 0.9625598788, blue: 0.9625478387, alpha: 1)
                }
                title.text = viewModel.getFilters()[indexPath.row]
                title.font = UIFont(name: "NotoSansKR-Regular", size: 13)
                title.textAlignment = .center
                title.clipsToBounds = true
                title.layer.cornerRadius = 14
                
                return cell
            }
        }
        // MARK: - second collectionView
        else if collectionView.tag == 1{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeetingDateCell", for: indexPath) as? MeetingDateCell{
                for v in cell.subviews{
                    v.removeFromSuperview()
                }
                
                if viewModel.getClickedDate() == indexPath.row{
                    cell.setupCell(textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                                   backColor: #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1),
                                   text: viewModel.getDates()[indexPath.row])
                }
                else{
                    cell.setupCell(textColor: #colorLiteral(red: 0.4520480633, green: 0.4520593286, blue: 0.4520532489, alpha: 1),
                                   backColor: #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1),
                                   text: viewModel.getDates()[indexPath.row])
                }
                return cell
            }
        }
        // MARK: - third collectionView
        else if collectionView.tag == 2{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeetingFilterCell", for: indexPath) as? FilterCell {
                for v in cell.subviews{
                    v.removeFromSuperview()
                }
                
                let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.width, height: 28))
                cell.addSubview(title)
                cell.setupCell(color: .white)
                if viewModel.getClickedGender() == indexPath.row{
                    title.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    title.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
                }
                else{
                    title.textColor = #colorLiteral(red: 0.4520480633, green: 0.4520593286, blue: 0.4520532489, alpha: 1)
                    title.backgroundColor = #colorLiteral(red: 0.9625374675, green: 0.9625598788, blue: 0.9625478387, alpha: 1)
                }
                title.text = viewModel.getGenders()[indexPath.row]
                title.font = UIFont(name: "NotoSansKR-Regular", size: 13)
                title.textAlignment = .center
                title.clipsToBounds = true
                title.layer.cornerRadius = 14
                
                return cell
            }
        }
        fatalError("Unable to dequeue subclassed cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0{
            viewModel.setClicked(count: indexPath.row)
            // 체크
            viewModel.activateNextButton()
            collectionView.reloadData()
        }
        else if collectionView.tag == 1{
            viewModel.setClickedDate(count: indexPath.row)
            viewModel.setDateDescription(string: viewModel.getDate(index: indexPath.row))
            // 체크
            viewModel.activateNextButton()
            collectionView.reloadData()
        }
        else if collectionView.tag == 2{
            viewModel.setClickedGender(count: indexPath.row)
            collectionView.reloadData()
        }
    }
}

extension MeetingDetailVC: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
}

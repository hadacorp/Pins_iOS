//
//  MeetingDetailVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/08.
//

import UIKit

class MeetingDetailVC: UIViewController {
    @IBOutlet weak var topTitleFirst: UILabel!
    @IBOutlet weak var topTitleSecond: UILabel!
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    public var scrollView: UIScrollView!
    public var collectionView: UICollectionView!
    
    private var viewModel = MeetingDetailViewModel()
    
    override func viewDidLoad() {
        setScrollView()
        setCollectionView()
        setUI()
    }
    
    private func setScrollView(){
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaInsets).offset(184)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
        }
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
        collectionView.register(MeetingFilterCell.self, forCellWithReuseIdentifier: "MeetingFilterCell")
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(collectionView)
        collectionView.snp.makeConstraints { view in
            view.width.equalTo(UIScreen.main.bounds.width - 28)
            view.centerX.equalTo(self.view)
            view.height.equalTo(208)
            view.top.equalTo(0)
        }
    }
}

// MARK: - UISetting
extension MeetingDetailVC{
    public func setUI(){
        createTriangle()
        createLine(top: 208)
        meetDateText()
        meetDateDescriptionText()
        dateCollectionView()
        createLine(top: 385)
    }
    
    public func createTriangle(){
        let blueTri = UIImageView(image: UIImage(named: "iconTriangleBlue"))
        let whiteTri = UIImageView(image: UIImage(named: "iconTriangleWhite"))
        
        self.view.addSubview(blueTri)
        self.view.addSubview(whiteTri)
        
        whiteTri.snp.makeConstraints { make in
            make.width.equalTo(4)
            make.height.equalTo(6)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.leading.equalTo(UIScreen.main.bounds.width / 3 - 2)
        }
        
        blueTri.snp.makeConstraints { make in
            make.width.equalTo(4)
            make.height.equalTo(6)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.trailing.equalTo(-UIScreen.main.bounds.width / 3 + 2)
        }
    }
    public func createLine(top: Int){
        let line = UIView()
        scrollView.addSubview(line)
        line.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.height.equalTo(8)
            make.leading.equalTo(0)
            make.top.equalTo(top)
        }
        line.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    }
    public func meetDateText(){
        let text = UILabel()
        scrollView.addSubview(text)
        text.snp.makeConstraints { make in
            make.width.equalTo(55)
            make.height.equalTo(20)
            make.top.equalTo(228)
            make.leading.equalTo(16)
        }
        text.text = "만남 날짜"
        text.font = UIFont(name: "NotoSansKR-Medium", size: 14)
    }
    public func meetDateDescriptionText(){
        let text = UILabel()
        scrollView.addSubview(text)
        text.snp.makeConstraints { make in
            make.width.equalTo(123)
            make.height.equalTo(20)
            make.top.equalTo(228)
            make.trailing.equalTo(self.view).offset(-16)
        }
        text.text = "날짜를 선택해 주세요"
        text.font = UIFont(name: "NotoSansKR-Light", size: 14)
        text.textColor = UIColor(named: "skyBlue")
    }
    
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
            view.top.equalTo(244)
        }
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
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // MARK: - first collectionView
        if collectionView.tag == 0{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeetingFilterCell", for: indexPath) as? MeetingFilterCell {
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
        fatalError("Unable to dequeue subclassed cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0{
            viewModel.setClicked(count: indexPath.row)
            collectionView.reloadData()
        }
        else if collectionView.tag == 1{
            viewModel.setClickedDate(count: indexPath.row)
            collectionView.reloadData()
        }
    }
}

extension MeetingDetailVC: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
}

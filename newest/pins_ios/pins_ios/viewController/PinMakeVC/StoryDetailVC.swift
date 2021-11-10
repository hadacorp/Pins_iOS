//
//  StoryDetailVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/09.
//

import UIKit

class StoryDetailVC: UIViewController {
    private var collectionView: UICollectionView!
    private var viewModel = StoryDetailViewModel()
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    override func viewDidLoad() {
        viewModel.setUI(parent: self.view)
        viewModel.nextButton.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        createTriangle()
        setCollectionView()
        meetSectionText(title: "카테고리", top: 104)
    }
    
    // MARK:- 오른쪽 메인 텍스트
    public func meetSectionText(title: String, top: Int){
        let text = UILabel()
        self.view.addSubview(text)
        text.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(20)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(top)
            make.leading.equalTo(16)
        }
        text.text = title
        text.font = UIFont(name: "NotoSansKR-Medium", size: 14)
    }
    
    // 카테고리
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
        collectionView.register(FilterCell.self, forCellWithReuseIdentifier: "StoryFilterCell")
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.showsHorizontalScrollIndicator = false
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { view in
            view.width.equalTo(UIScreen.main.bounds.width - 28)
            view.centerX.equalTo(self.view)
            view.height.equalTo(208)
            view.top.equalTo(self.view.safeAreaLayoutGuide).offset(140)
        }
    }
    
    // MARK:- 상단 작은 삼각형
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
    
    @objc func nextView(){
        if viewModel.checkNext(){
            let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "StoryContentVC") as! StoryContentVC
            // save
//            viewModel.saveSetting()
            self.navigationController!.pushViewController(VC1, animated: false)
        }
    }
}

extension StoryDetailVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getFiltersCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryFilterCell", for: indexPath) as? FilterCell {
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
        
        fatalError("Unable to dequeue subclassed cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0{
            viewModel.setClicked(count: indexPath.row)
            // 체크
            viewModel.activateNextButton()
            collectionView.reloadData()
        }
    }
}

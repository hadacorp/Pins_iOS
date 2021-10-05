//
//  FilterController.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/05.
//

import UIKit

class MeetingFilterController: UIViewController {
    @IBAction func communityFilterBtn(_ sender: Any) {
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "CommunityFilterVC") as! CommunityFilterController
        
        self.navigationController!.pushViewController(VC1, animated: false)
    }
    @IBAction func storyFilterBtn(_ sender: Any) {
        print("스토리 필터")
    }
    @IBAction func backFilterBtn(_ sender: Any) {
        let controllers = self.navigationController?.viewControllers
        for vc in controllers! {
            if vc is ViewController {
                _ = self.navigationController?.popToViewController(vc as! ViewController, animated: true)
            }
        }
    }
    public var collectionView: UICollectionView!
    
    private var viewModel = MeetingFilterViewModel()
      
    override func viewDidLoad() {
        setCollectionView()
    }
    
    private func setCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        layout.itemSize = CGSize(width: Int((UIScreen.main.bounds.width - 48) / 3), height: 28)
        layout.minimumLineSpacing = 24
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MeetingFilterCell.self, forCellWithReuseIdentifier: "MeetingFilterCell")
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.showsHorizontalScrollIndicator = false
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { view in
            view.width.equalTo(UIScreen.main.bounds.width)
            view.height.equalTo(208)
            view.top.equalTo(self.view.safeAreaInsets).offset(184)
            view.leading.equalTo(10)
            view.trailing.equalTo(-10)
        }
    }
}

extension MeetingFilterController: UICollectionViewDelegate, UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getFiltersCount()
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeetingFilterCell", for: indexPath) as? MeetingFilterCell {
            for v in cell.subviews{
                v.removeFromSuperview()
            }
            
            let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.width, height: 28))
            cell.addSubview(title)
            cell.setupCell(color: .white)
            if viewModel.getClickList()[indexPath.row] == 0{
                title.textColor = #colorLiteral(red: 0.4520480633, green: 0.4520593286, blue: 0.4520532489, alpha: 1)
                title.backgroundColor = #colorLiteral(red: 0.9625374675, green: 0.9625598788, blue: 0.9625478387, alpha: 1)
            }
            else{
                title.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                title.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
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
        viewModel.clickFilter(index: indexPath.row)
        collectionView.reloadData()
    }
}


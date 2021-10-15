//
//  CommunityDetailVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/14.
//

import UIKit

class CommunityDetailVC: UIViewController {
    // MARK:- IBAction func
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    // MARK:- Private variable
    private var scrollView: UIScrollView!
    private var collectionView: UICollectionView!
    
    // MARK:- Public variable
    public var viewModel: CommunityDetailViewModel!
    
    // MARK:- Life cycle
    override func viewDidLoad() {
        // 스크롤 방지
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        setScrollView()
        setCollectionView()
        joinTypeCollectionView()
        profileTypeCollectionView()
        
        viewModel = CommunityDetailViewModel(parent: scrollView, view: self.view)
        viewModel.setUI()
    }
    
    // MARK:- Private func
    // 상위 스크롤 뷰
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
        collectionView.register(FilterCell.self, forCellWithReuseIdentifier: "CommunityFilterCell")
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
    
    // 참가 방식
    public func joinTypeCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: Int((UIScreen.main.bounds.width - 48) / 2), height: 28)
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.tag = 1
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FilterCell.self, forCellWithReuseIdentifier: "JoinTypeCell")
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(collectionView)
        collectionView.snp.makeConstraints { view in
            view.width.equalTo(UIScreen.main.bounds.width - 32)
            view.centerX.equalTo(self.view)
            view.height.equalTo(28)
            view.top.equalTo(320)
        }
    }
    
    // 프로필 방식
    public func profileTypeCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: Int((UIScreen.main.bounds.width - 48) / 2), height: 28)
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.tag = 2
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FilterCell.self, forCellWithReuseIdentifier: "ProfileTypeCell")
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(collectionView)
        collectionView.snp.makeConstraints { view in
            view.width.equalTo(UIScreen.main.bounds.width - 32)
            view.centerX.equalTo(self.view)
            view.height.equalTo(28)
            view.top.equalTo(432)
        }
    }
}

extension CommunityDetailVC: UIScrollViewDelegate{
    
}

extension CommunityDetailVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommunityFilterCell", for: indexPath) as? FilterCell {
                for v in cell.subviews{
                    v.removeFromSuperview()
                }
                
                let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.width, height: 28))
                cell.addSubview(title)
                cell.setupCell(color: .white)
                if viewModel.getFilterClicked() == indexPath.row{
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
        else if collectionView.tag == 1{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JoinTypeCell", for: indexPath) as? FilterCell {
                for v in cell.subviews{
                    v.removeFromSuperview()
                }
                
                let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.width, height: 28))
                cell.addSubview(title)
                cell.setupCell(color: .white)
                if viewModel.getJoinTypeClicked() == indexPath.row{
                    title.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    title.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
                }
                else{
                    title.textColor = #colorLiteral(red: 0.4520480633, green: 0.4520593286, blue: 0.4520532489, alpha: 1)
                    title.backgroundColor = #colorLiteral(red: 0.9625374675, green: 0.9625598788, blue: 0.9625478387, alpha: 1)
                }
                title.text = viewModel.getJoinsType()[indexPath.row]
                title.font = UIFont(name: "NotoSansKR-Regular", size: 13)
                title.textAlignment = .center
                title.clipsToBounds = true
                title.layer.cornerRadius = 14
                
                return cell
            }
        }
        
        else if collectionView.tag == 2{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileTypeCell", for: indexPath) as? FilterCell {
                for v in cell.subviews{
                    v.removeFromSuperview()
                }
                
                let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.width, height: 28))
                cell.addSubview(title)
                cell.setupCell(color: .white)
                if viewModel.getProfileClicked() == indexPath.row{
                    title.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    title.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
                }
                else{
                    title.textColor = #colorLiteral(red: 0.4520480633, green: 0.4520593286, blue: 0.4520532489, alpha: 1)
                    title.backgroundColor = #colorLiteral(red: 0.9625374675, green: 0.9625598788, blue: 0.9625478387, alpha: 1)
                }
                title.text = viewModel.getProfileType()[indexPath.row]
                title.font = UIFont(name: "NotoSansKR-Regular", size: 13)
                title.textAlignment = .center
                title.clipsToBounds = true
                title.layer.cornerRadius = 14
                
                return cell
            }
        }
        fatalError()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{
            return viewModel.getFiltersCount()
        }
        else if collectionView.tag == 1{
            return 2
        }
        else if collectionView.tag == 2{
            return 2
        }
        fatalError()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0{
            viewModel.setFilterClicked(count: indexPath.row)
            // 체크
//            viewModel.activateNextButton()
            collectionView.reloadData()
        }
        else if collectionView.tag == 1{
            viewModel.setJoinTypeClicked(type: indexPath.row)
            collectionView.reloadData()
        }
        else if collectionView.tag == 2{
            viewModel.setProfileClicked(type: indexPath.row)
            collectionView.reloadData()
        }
    }
}

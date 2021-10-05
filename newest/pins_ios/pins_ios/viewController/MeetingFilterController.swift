//
//  FilterController.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/05.
//

import UIKit

class MeetingFilterController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
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
    private var viewModel = MeetingFilterViewModel()
    
    private let sectionInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
      
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension MeetingFilterController: UICollectionViewDelegate, UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getFiltersCount()
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "meetingFilterCell", for: indexPath) as! MeetingFilterCell
        
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.width, height: 28))
        title.text = viewModel.getFilters()[indexPath.row]
        if viewModel.getClickList()[indexPath.row] == 0{
            title.textColor = #colorLiteral(red: 0.4520480633, green: 0.4520593286, blue: 0.4520532489, alpha: 1)
            title.backgroundColor = #colorLiteral(red: 0.9625374675, green: 0.9625598788, blue: 0.9625478387, alpha: 1)
        }
        else{
            title.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            title.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        }
        title.font = UIFont(name: "NotoSansKR-Regular", size: 13)
        title.textAlignment = .center
        title.clipsToBounds = true
        title.layer.cornerRadius = 14
        
        cell.contentView.addSubview(title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.clickFilter(index: indexPath.row)
        collectionView.reloadData()
    }
}

extension MeetingFilterController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    // 상하 여백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    // cell 사이즈( 옆 라인을 고려하여 설정 )
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.width - 48) / 3
        let size = CGSize(width: width, height: 28)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}

//
//  ProfileVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/30.
//

import UIKit

class ProfileVC: UIViewController, BaseViewController {
    //MARK: - UI Variable
    let proTitle1: UILabel = {
        let label = UILabel()
        label.text = "마지막으로"
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return label
    }()
    let proTitle2: UILabel = {
        let label = UILabel()
        label.text = "프로필 사진을 등록해 주세요."
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        return label
    }()
}

//MARK: - Life Cycle
extension ProfileVC{
    override func viewDidLoad() {
        setUI()
    }
}

//MARK: - UI Logic
extension ProfileVC{
    func setUI() {
        setDelegate()
        addSubViews()
        setLayout()
    }
    
    func setDelegate() {
        
    }
    
    func addSubViews() {
        
    }
    
    func setLayout() {
        
    }
}

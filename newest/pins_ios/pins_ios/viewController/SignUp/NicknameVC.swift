//
//  NicknameVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/26.
//

import UIKit

class NicknameVC: UIViewController, BaseViewController {
    let backBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "btnBack"), for: .normal)
        btn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return btn
    }()
    
    let titleLabel_1: UILabel = {
        let label = UILabel()
        label.text = "본인 인증 완료."
        label.numberOfLines = 2
        label.setLineSpacing(lineSpacing: 2.0)
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return label
    }()
    let titleLabel_2: UILabel = {
        let label = UILabel()
        label.text = "사용하실 닉네임을 입력해 주세요!"
        label.numberOfLines = 2
        label.setLineSpacing(lineSpacing: 2.0)
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return label
    }()
}

// MARK: - VIewController LifeCycle
extension NicknameVC{
    override func viewDidLoad() {
        setUI()
    }
}

// MARK: - ViewController Setting UI
extension NicknameVC{
    func setUI() {
        setDelegate()
        addSubViews()
        setLayout()
    }
    
    func setDelegate() {
        
    }
    
    func addSubViews() {
        view.addSubview(backBtn)
        view.addSubview(titleLabel_1)
        view.addSubview(titleLabel_2)
    }
    
    func setLayout() {
        backBtn.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.width.height.equalTo(48)
        }
        titleLabel_1.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(64)
        }
        titleLabel_2.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(104)
        }
    }
}

// MARK: - ViewController Event Function
extension NicknameVC{
    @objc
    func backAction(){
        self.navigationController?.popViewController(animated: true)
    }
}

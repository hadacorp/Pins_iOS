//
//  CertificationVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/25.
//

import Foundation
import UIKit

// MARK: - ViewController Main Variable
class CertificationVC: UIViewController, BaseViewController{
    let backBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "btnBack"), for: .normal)
        btn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return btn
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "문자로 전송된\n인증번호 6자리를 입력해 주세요."
        label.numberOfLines = 2
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return label
    }()
}

// MARK: - ViewController LifeCycle
extension CertificationVC{
    override func viewDidLoad() {
        setUI()
    }
}

// MARK: - ViewController Setting UI
extension CertificationVC{
    func setUI() {
        setDelegate()
        addSubViews()
        setLayout()
    }
    
    func setDelegate() {
        
    }
    
    func addSubViews() {
        view.addSubview(backBtn)
        view.addSubview(titleLabel)
    }
    
    func setLayout() {
        backBtn.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.width.height.equalTo(48)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(64)
            make.height.equalTo(69)
        }
    }
}

// MARK: - ViewController Event Function
extension CertificationVC{
    @objc
    func backAction(){
        self.navigationController?.popViewController(animated: true)
    }
}

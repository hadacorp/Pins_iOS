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
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return label
    }()
    let titleLabel_2: UILabel = {
        let label = UILabel()
        label.text = "사용하실 닉네임을 입력해 주세요!"
        label.numberOfLines = 2
        label.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return label
    }()
    
    let nickPlaceholder: UILabel = {
        let placeholder = UILabel()

        placeholder.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        placeholder.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        placeholder.text = "닉네임"
        placeholder.textAlignment = .left
        return placeholder
    }()
    
    let nickTextField: UITextField = {
        let textField = UITextField()
        
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        textField.setPlaceholderColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
        textField.tag = 4
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let nickLine: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        return line
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
        view.addSubview(nickTextField)
        view.addSubview(nickLine)
        nickTextField.addSubview(nickPlaceholder)
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

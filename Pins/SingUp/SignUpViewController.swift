//
//  SingUpViewController.swift
//  Pins
//
//  Created by judongseok on 2022/04/17.
//

import Foundation
import UIKit

class SignUpViewController: BaseViewController {
    // MARK: - public variable
    var nameTextField: CustomTextField!
    var namePlaceholder: CustomLabel!
    var backButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.becomeFirstResponder()
        rxSetup()
    }
    
    override func setupUI() {
        self.view.backgroundColor = .white
        
        backButton = CustomButton(parent: self.view)
            .makeConstraints {
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(0)
                $0.leading.equalTo(0)
            }
            .setImage(image: UIImage(named: "back")!)
        
        CustomLabel(parent: self.view)
            .makeConstraints {
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(67)
                $0.leading.equalTo(16)
            }
            .setText(text: "이름을 입력해 주세요.")
            .setFont(name: "NotoSansKR-Medium", size: 20)
            .setColor(color: UIColor.black)
        
        nameTextField = CustomTextField(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(16)
                $0.trailing.equalTo(-16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(140)
                $0.height.equalTo(37)
            }
            .setCursorColor(color: UIColor(hex: "1DAAF3"))
            .setTextColor(color: UIColor.black)
            .setFont(name: "NotoSansKR-Regular", size: 16)
            .setDelegate(delegate: self)
        
        namePlaceholder = CustomLabel(parent: nameTextField)
            .makeConstraints { [self] in
                // $0.bottom.equalTo(nameTextField.snp.top).offset(1)
                $0.bottom.equalTo(nameTextField.snp.bottom)
                $0.leading.equalTo(0)
                $0.height.equalTo(37)
            }
            .setFont(name: "NotoSansKR-Regular", size: 20)
            .setText(text: "이름")
            .setColor(color: UIColor.init(hex: "999999"))
        
        CustomView(parent: self.view)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.trailing.equalTo(-16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(172)
                $0.height.equalTo(2)
            }
            .setColor(color: UIColor.init(hex: "1DAAF3"))
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        // 애니메이션 작동
        namePlaceholderAnimation(isTyping: textField.text == "" ? false : true)
    }
}

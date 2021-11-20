//
//  LoginVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/17.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var whiteButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    var signupForm: SignupForm!
    override func viewDidLoad() {
        setUI()
    }
    
    private func setUI(){
        whiteButton.layer.cornerRadius = 8;
        blueButton.layer.cornerRadius = 8;
        
        whiteButton.shadow(x: 0, y: 4, blur: 8, spread: 0, opacity: 0.16)
        blueButton.shadow(x: 0, y: 4, blur: 8, spread: 0, opacity: 0.16)
        
        phoneNumberTextField.delegate = self
        phoneNumberPlaceholder()
    }
}

// UI
extension LoginVC{
    func phoneNumberPlaceholder(){
        let placeholder = UILabel()
        self.view.addSubview(placeholder)
        
        placeholder.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        placeholder.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        placeholder.text = "휴대폰 번호"
        
        placeholder.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(137)
        }
    }
    
    var phoneNumberTextField: UITextField{
        let textField = UITextField()
        self.view.addSubview(textField)
        
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        textField.setPlaceholderColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
        textField.tag = 1
        
        textField.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(137)
        }
        
        return textField
    }
    
}

extension LoginVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1{
            // 애니메이션
            phoneNumberTextField.font = UIFont(name: "NotoSansKR-Regular", size: 14)
            phoneNumberTextField.snp.updateConstraints { make in
                make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16)
                make.trailing.equalTo(0)
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(117)
            }
        }
    }
}

//
//  SignUpVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/21.
//

import UIKit

class SignUpVC: UIViewController, BaseViewController{
    // MARK: -ViewController LifeCycle
    override func viewDidLoad() {
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.nameTextField.becomeFirstResponder()
    }
    
    // MARK: -Initial UI
    
    let nameLine: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        return line
    }()
    
    let backBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "btnBack"), for: .normal)
        btn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return btn
    }()
    
    let phoneNumberPlaceholder: UILabel = {
        let placeholder = UILabel()

        placeholder.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        placeholder.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        placeholder.text = "휴대폰 번호"
        placeholder.textAlignment = .left
        return placeholder
    }()
    
    let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        textField.setPlaceholderColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
        textField.tag = 1
        
        return textField
    }()
    
    let namePlaceholder: UILabel = {
        let placeholder = UILabel()

        placeholder.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        placeholder.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        placeholder.text = "이름"
        placeholder.textAlignment = .left
        return placeholder
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        textField.setPlaceholderColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
        textField.tag = 1
        
        return textField
    }()
    
    let nameSuccess: UIButton = {
        let button = UIButton()
        
        button.setTitle("확인", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        
        button.addTarget(self, action: #selector(nameDownAction), for: .touchUpInside)
        return button
    }()
    
    let mainTitle: UILabel = {
        let title = UILabel()
        
        title.text = "이름을 입력해 주세요."
        title.font = UIFont(name: "NotoSansKR-Medium", size: 20)
        title.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        return title
    }()
    
    let idcardPlaceholder: UILabel = {
        let placeholder = UILabel()

        placeholder.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        placeholder.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        placeholder.text = "주민등록번호"
        placeholder.textAlignment = .left
        placeholder.layer.opacity = 0
        return placeholder
    }()
    
    let idcardTextField: UITextField = {
        let textField = UITextField()
        
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        textField.setPlaceholderColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
        textField.tag = 2
        textField.layer.opacity = 0
        return textField
    }()
    
    let idLine: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        line.layer.opacity = 0
        return line
    }()
    
    let idSlash: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        line.layer.opacity = 0
        return line
    }()
}

// MARK: -Extension
extension SignUpVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1{
            placeholderUp(text: namePlaceholder)
        }
        if textField.tag == 2{
            placeholderUp(text: idcardPlaceholder)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1{
            lineFocus(line: nameLine)
        }
        else if textField.tag == 2{
            lineFocus(line: idLine)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 1{
            lineUnfocus(line: nameLine)
        }
        else if textField.tag == 2{
            lineUnfocus(line: idLine)
        }
    }
}

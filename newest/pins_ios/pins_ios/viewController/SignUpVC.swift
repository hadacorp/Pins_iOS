//
//  SignUpVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/21.
//

import UIKit

class SignUpVC: UIViewController, BaseViewController{
    override func viewDidLoad() {
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.nameTextField.becomeFirstResponder()
    }
    
    let nameLine: UIView = {
        let line = UIView()
        
        line.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        return line
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
    
    let nameSuccess: UILabel = {
        let button = UILabel()
        
        button.text = "확인"
        button.textAlignment = .center
        button.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        button.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        return button
    }()
}

extension SignUpVC{
    @objc
    func keyboardWillShow(_ sender: Notification) {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keybaordRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keybaordRectangle.height
            
            nameSuccess.snp.makeConstraints { make in
                make.bottom.equalTo(-keyboardHeight)
            }
        }
    }
    
     func setUI(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        addSubViews()
        setLayout()
        setDelegate()
    }
    
    func setDelegate(){
        nameTextField.delegate = self
    }
    
    func addSubViews(){
        view.addSubview(nameTextField)
        nameTextField.addSubview(namePlaceholder)
        view.addSubview(nameLine)
        view.addSubview(nameSuccess)
    }
    
    func setLayout(){
        namePlaceholder.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(0)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(137)
        }
        
        nameLine.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(170)
            make.height.equalTo(2)
        }
        
        nameSuccess.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(0)
            make.height.equalTo(48)
        }
    }
    
    func placeholderUp(text: UILabel){
        // 애니메이션
        text.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        text.snp.remakeConstraints {
            $0.top.equalTo(-20)
        }
    }
    
    func lineFocus(){
        nameLine.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
    }
    
    func lineUnfocus(){
        nameLine.backgroundColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    }
}

extension SignUpVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1{
            placeholderUp(text: namePlaceholder)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1{
            lineFocus()
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 1{
            lineUnfocus()
        }
    }
}

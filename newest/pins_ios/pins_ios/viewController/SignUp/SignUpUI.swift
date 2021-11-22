//
//  SignUpUI.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/21.
//

import UIKit

extension SignUpVC{
     func setUI(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        addSubViews()
        setLayout()
        setDelegate()
    }
    
    func setDelegate(){
        nameTextField.delegate = self
        idcardTextField.delegate = self
    }
    
    func addSubViews(){
        view.addSubview(nameTextField)
        nameTextField.addSubview(namePlaceholder)
        view.addSubview(nameLine)
        view.addSubview(nameSuccess)
        view.addSubview(mainTitle)
        view.addSubview(backBtn)
        view.addSubview(idcardTextField)
        idcardTextField.addSubview(idcardPlaceholder)
        view.addSubview(idLine)
        view.addSubview(idSlash)
    }
    
    func setLayout(){
        mainTitle.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(64)
        }
        
        namePlaceholder.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(137)
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
        
        backBtn.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(4)
            make.width.height.equalTo(48)
        }
        
        idcardPlaceholder.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(137)
        }
        
        idcardTextField.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(137)
            make.width.equalTo(UIScreen.main.bounds.width * 0.39)
        }
        
        idLine.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(170)
            make.width.equalTo(UIScreen.main.bounds.width * 0.39)
            make.height.equalTo(2)
        }
        
        idSlash.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(152)
            make.centerX.equalTo(self.view)
            make.width.equalTo(16)
            make.height.equalTo(2)
        }
    }
    
    func placeholderUp(text: UILabel){
        // 애니메이션
        text.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) {
            text.snp.remakeConstraints {
                $0.top.equalTo(-20)
            }
            self.view.layoutIfNeeded()
        }
    }
    
    func appearId(){
        idcardTextField.layer.opacity = 1
        idcardPlaceholder.layer.opacity = 1
        idLine.layer.opacity = 1
        idSlash.layer.opacity = 1
        
        idcardTextField.becomeFirstResponder()
    }
    
    func lineFocus(line: UIView){
        line.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
    }
    
    func lineUnfocus(line: UIView){
        line.backgroundColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    }
    
    func changeTitle(text: String){
        mainTitle.text = text
    }
}

// MARK: -Event
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
    
    @objc
    func backAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func nameDownAction(){
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) { [self] in
            namePlaceholder.snp.makeConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(194)
            }
            nameTextField.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(214)
            }
            nameLine.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(247)
            }
            
            lineUnfocus(line: nameLine)
            nameSuccess.isHidden = true
            
            appearId()
            
            self.view.layoutIfNeeded()
        }
        
        changeTitle(text: "주민등록번호를 입력해 주세요.")
    }
}

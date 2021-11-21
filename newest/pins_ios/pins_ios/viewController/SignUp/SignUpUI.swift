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
    }
    
    func addSubViews(){
        view.addSubview(nameTextField)
        nameTextField.addSubview(namePlaceholder)
        view.addSubview(nameLine)
        view.addSubview(nameSuccess)
        view.addSubview(mainTitle)
        view.addSubview(backBtn)
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
    }
    
    func placeholderUp(text: UILabel){
        // 애니메이션
        text.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        text.snp.remakeConstraints {
            $0.top.equalTo(-20)
        }
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
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) { [self] in
            namePlaceholder.snp.makeConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(194)
            }
            nameTextField.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(214)
            }
            nameLine.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(247)
            }
            
            self.view.layoutIfNeeded()
        }
        lineUnfocus(line: nameLine)
        changeTitle(text: "주민등록번호를 입력해 주세요.")
    }
}

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
        idcardFirstTextField.delegate = self
        idcardLastTextField.delegate = self
    }
    
    func addSubViews(){
        view.addSubview(nameTextField)
        nameTextField.addSubview(namePlaceholder)
        view.addSubview(nameLine)
        view.addSubview(nameSuccess)
        view.addSubview(mainTitle)
        view.addSubview(backBtn)
        view.addSubview(idcardFirstTextField)
        idcardFirstTextField.addSubview(idcardFirstPlaceholder)
        view.addSubview(idLineFirst)
        view.addSubview(idSlashFirst)
        view.addSubview(idcardLastTextField)
        view.addSubview(idLineLast)
        view.addSubview(idDots)
        view.addSubview(mobileLine)
        view.addSubview(mobileLabel)
        view.addSubview(mobileUnfold)
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
        
        idcardFirstPlaceholder.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(137)
        }
        
        idcardFirstTextField.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(137)
            make.width.equalTo(UIScreen.main.bounds.width * 0.39)
        }
        
        idLineFirst.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(170)
            make.width.equalTo(UIScreen.main.bounds.width * 0.39)
            make.height.equalTo(2)
        }
        
        idSlashFirst.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(152)
            make.centerX.equalTo(self.view)
            make.width.equalTo(16)
            make.height.equalTo(2)
        }
        
        idcardLastTextField.snp.makeConstraints { make in
            make.trailing.equalTo(-143)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(137)
            make.width.equalTo(12)
        }
        
        idLineLast.snp.makeConstraints { make in
            make.trailing.equalTo(-136)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(170)
            make.width.equalTo(27)
            make.height.equalTo(2)
        }
        
        idDots.snp.makeConstraints { make in
            make.trailing.equalTo(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(144)
            make.width.equalTo(120)
            make.height.equalTo(16)
        }
        
        mobileLine.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(170)
            make.height.equalTo(2)
        }
        
        mobileLabel.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(137)
        }
        
        mobileUnfold.snp.makeConstraints { make in
            make.trailing.equalTo(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(151)
            make.width.equalTo(10)
            make.height.equalTo(5)
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
        idcardFirstTextField.layer.opacity = 1
        idcardFirstPlaceholder.layer.opacity = 1
        idLineFirst.layer.opacity = 1
        idSlashFirst.layer.opacity = 1
        idcardLastTextField.layer.opacity = 1
        idLineLast.layer.opacity = 1
        idDots.layer.opacity = 1
        
        idcardFirstTextField.becomeFirstResponder()
    }
    
    func appearMobile(){
        mobileUnfold.layer.opacity = 1
        mobileLabel.layer.opacity = 1
        mobileLine.layer.opacity = 1
        lineFocus(line: mobileLine)
        self.view.endEditing(true)
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
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) { [self] in
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
    
    func idcardDownAction(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) { [self] in
            namePlaceholder.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(271)
            }
            nameTextField.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(291)
            }
            nameLine.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(324)
            }
            
            idDots.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(221)
            }
            idcardLastTextField.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(214)
            }
            idLineLast.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(247)
            }
            idLineFirst.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(247)
            }
            idcardFirstPlaceholder.snp.makeConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(194)
            }
            idcardFirstTextField.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(214)
            }
            idSlashFirst.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(229)
            }
            appearMobile()
            self.view.layoutIfNeeded()
        }
        
        lineUnfocus(line: idLineLast)
        changeTitle(text: "통신사를 선택해 주세요.")
    }
}

//
//  SignUpView.swift
//  Pins
//
//  Created by judongseok on 2022/06/02.
//

import UIKit

extension SignUpViewController {
    func setUI() {
        self.view.backgroundColor = .white
        
        backButton = CustomButton(parent: self.view)
            .makeConstraints {
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(0)
                $0.leading.equalTo(0)
            }
            .setImage(image: UIImage(named: "back")!)
    
        contentLabel = CustomLabel(parent: self.view)
            .makeConstraints {
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(67)
                $0.leading.equalTo(16)
            }
            .setText(text: "만나서 반가워요 :)\n이름을 알려주세요")
            .setLineHeight(size: 2)
            .setFont(name: "NotoSansKR-Medium", size: 20)
            .setColor(color: UIColor.black)
        
        // MARK: - Name UI
        nameBackground = CustomView(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(16)
                $0.trailing.equalTo(-16)
                $0.top.equalTo(self.contentLabel.snp.bottom).offset(30)
                $0.height.equalTo(37)
            }
        
        nameTextField = CustomTextField(parent: nameBackground)
            .makeConstraints{
                $0.leading.equalTo(0)
                $0.trailing.equalTo(0)
                $0.top.equalTo(0)
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
        
        nameLine = CustomView(parent: nameBackground)
            .makeConstraints {
                $0.leading.equalTo(0)
                $0.trailing.equalTo(0)
                $0.top.equalTo(37)
                $0.height.equalTo(2)
            }
            .setColor(color: UIColor.init(hex: "1DAAF3"))
        
        nextButton = CustomButton(parent: self.view)
            .setColor(color: UIColor.systemBlue.cgColor)
            .setOpacity(opacity: 0.5)
            .setTitle(title: "확인")
            .setTitleFont(name: "NotoSansKR-Regular", size: 20)
    }
}

//
//  SignUpUserIDView.swift
//  Pins
//
//  Created by judongseok on 2022/06/02.
//

import UIKit

extension SignUpViewController {
    func initUserID() {
        contentLabel.setText(text: "본인 인증을 위해\n주민등록번호를 입력해 주세요")
            .setLineHeight(size: 2)
        
        userIDTextField = CustomTextField(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(16)
                $0.trailing.equalTo(-16)
                $0.top.equalTo(self.contentLabel.snp.bottom).offset(30)
                $0.height.equalTo(37)
            }
            .setCursorColor(color: UIColor(hex: "1DAAF3"))
            .setTextColor(color: UIColor.black)
            .setFont(name: "NotoSansKR-Regular", size: 16)
            .setDelegate(delegate: self)
    }
    
    func downNameUI() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) { [self] in
            nameBackground.snp.updateConstraints {
                $0.top.equalTo(contentLabel.snp.bottom).offset(100)
            }
            nameBackground.superview?.layoutIfNeeded()
        }
    }
}

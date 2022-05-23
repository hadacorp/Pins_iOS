//
//  LoginViewController.swift
//  Pins
//
//  Created by judongseok on 2022/03/26.
//

import Foundation
import SwiftUI

class LoginViewController: BaseViewController {
    // MARK: - public variable
    var signupBtn: CustomButton!
    var signinBtn: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        rxSetup()
    }
    
    override func setupUI() {
        signupBtn = CustomButton(parent: self.view)
            .makeConstraints {
                $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-33)
                $0.trailing.equalTo(-16)
                $0.height.equalTo(48)
                $0.width.equalTo((UIScreenSize.shared.width - 32 - 7) / 2)
            }
            .setRounded(size: 8)
            .setColor(color: UIColor.init(hex: "1DAAF3").cgColor)
            .setTitle(title: "처음이에요")
            .setTitleColor(color: .white)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor.black.cgColor)
            .setTitleFont(name: "NotoSansKR-Regular", size: 16)
        
        signinBtn = CustomButton(parent: self.view)
            .makeConstraints {
                $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-33)
                $0.leading.equalTo(16)
                $0.height.equalTo(48)
                $0.width.equalTo((UIScreenSize.shared.width - 32 - 7) / 2)
            }
            .setRounded(size: 8)
            .setColor(color: UIColor.white.cgColor)
            .setTitle(title: "기존 회원이에요")
            .setTitleColor(color: .black)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor.black.cgColor)
            .setTitleFont(name: "NotoSansKR-Regular", size: 16)
        
        CustomLabel(parent: self.view)
            .makeConstraints {
                $0.centerX.equalTo(self.view)
                $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
                $0.height.equalTo(17)
            }
            .setText(text: "ⓒ 2021. 하다코퍼레이션 inc. All rights reserved.")
            .setFont(name: "NotoSansKR-Regular", size: 12)
            .setColor(color: UIColor.init(hex: "999999"))
    }
}

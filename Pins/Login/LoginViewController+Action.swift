//
//  LoginViewController+Action.swift
//  Pins
//
//  Created by judongseok on 2022/04/17.
//
import UIKit
import Foundation

extension LoginViewController {
    // 회원가입 뷰로 넘어가기
    @objc
    func signUp() {
        let signUpView = SignUpViewController()
        self.navigationController?.pushViewController(signUpView, animated: true)
    }
    
    
}

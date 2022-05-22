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
    func rxSetup() {
        signupBtn.rx.tap
            .subscribe(onNext: { [weak self] in
                let signupView = SignUpViewController()
                self?.navigationController?.pushViewController(signupView, animated: true)
            })
            .disposed(by: disposeBag)
        
        signinBtn.rx.tap
            .subscribe(onNext: { [weak self] in
                let signinView = ViewController()
                self?.navigationController?.pushViewController(signinView, animated: true)
            })
            .disposed(by: disposeBag)
    }
}

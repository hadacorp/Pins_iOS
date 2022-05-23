//
//  SignUpViewController+Action.swift
//  Pins
//
//  Created by judongseok on 2022/04/18.
//

import UIKit

extension SignUpViewController {
    func namePlaceholderAnimation(isTyping: Bool) {
        if isTyping {
            UIView.animate(withDuration: 0.2, delay: 0) { [self] in
                let anchorPoint = CGPoint(x: 0.75, y: 0.5)
                namePlaceholder.layer.anchorPoint = anchorPoint
                namePlaceholder.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                namePlaceholder.snp.updateConstraints {
                    $0.bottom.equalToSuperview().offset(-31)
                    $0.leading.equalTo(0)
                    $0.height.equalTo(20)
                }
                namePlaceholder.superview?.layoutIfNeeded()
            }
            
            // 확인 버튼 opacity 조정
            nextButton.setOpacity(opacity: 1.0)
            viewModel.isNext = true
        }
        else {
            UIView.animate(withDuration: 0.2, delay: 0) { [self] in
                let anchorPoint = CGPoint(x: 0.5, y: 0.5)
                namePlaceholder.layer.anchorPoint = anchorPoint
                namePlaceholder.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                namePlaceholder.snp.updateConstraints {
                    $0.bottom.equalToSuperview()
                    $0.leading.equalTo(0)
                    $0.height.equalTo(37)
                }
                namePlaceholder.superview?.layoutIfNeeded()
            }
            
            // 확인 버튼 opacity 조정
            nextButton.setOpacity(opacity: 0.5)
            viewModel.isNext = false
        }
    }
    func rxSetup(){
        backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        nameTextField.rx.text
            .subscribe(onNext: { [weak self] text in
                self?.namePlaceholderAnimation(isTyping: self?.nameTextField.text == "" ? false : true)
            })
            .disposed(by: disposeBag)
        
        nextButton.rx.tap
            .subscribe(onNext: { [weak self] in
                if self!.viewModel.isNext {
                    print("화면 전환")
                }
            })
            .disposed(by: disposeBag)
    }
}

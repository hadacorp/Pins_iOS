//
//  SingUpViewController.swift
//  Pins
//
//  Created by judongseok on 2022/04/17.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SignUpViewController: UIViewController {
    // MARK: - public variable
    // ViewModel
    let viewModel = SignUpViewModel()
    // DisposeBag
    let disposeBag = DisposeBag()
    // Name UI
    var nameBackground: CustomView!
    var nameTextField: CustomTextField!
    var contentLabel: CustomLabel!
    var namePlaceholder: CustomLabel!
    var nameLine: CustomView!
    var nextButton: CustomButton!
    // UserID UI
    var userIDTextField: CustomTextField!
    
    // Back Button
    var backButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        self.navigationController?.isNavigationBarHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        nameTextField.becomeFirstResponder()
        rxSetup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated) // observer를 전부 제거
        NotificationCenter.default.removeObserver(self)
    }
}

extension SignUpViewController {
    @objc func keyboardWillShow(_ notification:NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            print("keyboardHeight = \(keyboardHeight)")
            
            nextButton
                .makeConstraints {
                    $0.leading.equalTo(0)
                    $0.trailing.equalTo(0)
                    $0.height.equalTo(50)
                    $0.bottom.equalTo(-keyboardHeight)
                }
        }
    }
}

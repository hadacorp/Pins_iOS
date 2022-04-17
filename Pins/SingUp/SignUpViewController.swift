//
//  SingUpViewController.swift
//  Pins
//
//  Created by judongseok on 2022/04/17.
//

import Foundation
import UIKit

class SignUpViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        self.view.backgroundColor = .white
        
        CustomButton(parent: self.view)
            .makeConstraints {
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
                $0.leading.equalTo(16)
            }
            .setImage(image: UIImage(named: "back")!)
    }
}

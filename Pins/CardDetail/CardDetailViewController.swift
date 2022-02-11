//
//  CardDetailViewController.swift
//  Pins
//
//  Created by judongseok on 2022/02/12.
//

import UIKit

class CardDetailViewController: BaseViewController {
    // MARK: - Property
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func setupUI() {
        CustomButton(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
                $0.width.equalTo(10)
                $0.height.equalTo(20)
            }
            .setImage(image: UIImage(named: "smallBack")!)
            .setAction(parent: self, action: #selector(backBtn))
    }
}

//
//  SearchViewController.swift
//  Pins
//
//  Created by judongseok on 2022/01/18.
//

import UIKit

class SearchViewController: BaseViewController {
    // MARK: - Property
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        CustomTextField(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(16)
                $0.trailing.equalTo(-16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
                $0.height.equalTo(40)
            }
            .setBorder(color: UIColor(hex: "666666"), width: 1)
            .setRounded(size: 16)
            .setPadding(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            .setCursorColor(color: UIColor(hex: "000000"))
            .setFont(name: "NotoSansKR-Regular", size: 16)
        
        CustomButton(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
                $0.width.height.equalTo(40)
            }
            .setImage(image: UIImage(named: "back")!)
            .setAction(parent: self, action: #selector(backBtn))
        
        CustomButton(parent: self.view)
            .makeConstraints{
                $0.trailing.equalTo(-16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
                $0.width.height.equalTo(40)
            }
            .setImage(image: UIImage(named: "cancel")!)
    }
}

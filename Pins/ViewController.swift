//
//  ViewController.swift
//  Pins
//
//  Created by judongseok on 2022/01/12.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        // 위측 버튼 4개
        RoundedButton(type: .small, parent: self.view)
            .setSize(width: 40, height: 40)
            .setupConstraints(top: 60, leading: 16)
            .setColor(color: CGColor.init(red: 1, green: 1, blue: 1, alpha: 1))
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: CGColor(red: 0, green: 0, blue: 0, alpha: 1))
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        RoundedButton(type: .small, parent: self.view)
            .setSize(width: 40, height: 40)
            .setupConstraints(top: 60, leading: UIScreenSize.shared.width! - 56)
            .setColor(color: CGColor.init(red: 1, green: 1, blue: 1, alpha: 1))
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: CGColor(red: 0, green: 0, blue: 0, alpha: 1))
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        RoundedButton(type: .small, parent: self.view)
            .setSize(width: 40, height: 40)
            .setupConstraints(top: 120, leading: UIScreenSize.shared.width! - 56)
            .setColor(color: UIColor.init(hex: "072156").cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: CGColor(red: 0, green: 0, blue: 0, alpha: 1))
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        RoundedButton(type: .small, parent: self.view)
            .setSize(width: 40, height: 40)
            .setupConstraints(top: 180, leading: UIScreenSize.shared.width! - 56)
            .setColor(color: CGColor.init(red: 1, green: 1, blue: 1, alpha: 1))
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: CGColor(red: 0, green: 0, blue: 0, alpha: 1))
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
    }
    
    @objc func printLog() {
        print("button clicked!")
    }
}


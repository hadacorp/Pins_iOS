//
//  Button.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/18.
//

import Foundation
import UIKit

protocol Button{
    var button: UIButton { get }
    
    func autoLayout(width: Int, height: Int)
}

extension Button{
    func autoLayout(width: Int, height: Int){
        button.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
    }
}

struct RoundedButton: Button{
    var button: UIButton
    var radius: CGFloat
    
    init(button: UIButton, radius: CGFloat){
        self.button = button
        self.radius = radius
        self.button.layer.cornerRadius = self.radius
    }
}

let button1: RoundedButton = RoundedButton(button: UIButton(), radius: 8)
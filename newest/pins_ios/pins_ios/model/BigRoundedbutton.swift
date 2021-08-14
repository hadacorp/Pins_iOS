//
//  BigRoundedbutton.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/14.
//

import UIKit
import SnapKit

class BigRoundedbutton {
    var button = UIButton()
    
    init(radius: CGFloat, color: UIColor) {
        button.backgroundColor = color
        button.layer.cornerRadius = radius
    }
}

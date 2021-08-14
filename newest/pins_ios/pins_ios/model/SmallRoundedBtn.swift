//
//  SmallRoundedBtn.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/10.
//

import UIKit
import SnapKit

class SmallRoundedBtn {
    var button = UIButton()
    
    init(radius: CGFloat, color: UIColor) {
        button.backgroundColor = color
        button.layer.cornerRadius = radius
    }
}

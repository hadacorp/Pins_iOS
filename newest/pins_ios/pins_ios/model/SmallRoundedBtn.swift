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
    
    init(radius: CGFloat, color: UIColor, image: UIImage) {
        button.backgroundColor = color
        button.layer.cornerRadius = radius
        button.setImage(image, for: .normal)
        
        button.layer.shadowOpacity = 0.16
        button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 8

        button.layer.masksToBounds = false
        
        button.layer.opacity = 0.9
    }
}

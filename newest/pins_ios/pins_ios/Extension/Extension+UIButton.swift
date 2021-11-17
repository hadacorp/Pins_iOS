//
//  Extension+UIButton.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/18.
//

import UIKit

extension UIButton{
    func shadow(x: Int, y: Int, blur: CGFloat, spread: Int, opacity: Float){
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowOpacity = opacity
        layer.shadowRadius = blur
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

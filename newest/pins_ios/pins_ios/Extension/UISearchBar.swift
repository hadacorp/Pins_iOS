//
//  UISearchBar.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/05.
//

import UIKit

extension UISearchBar {
    func changeSearchBarColor(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContext(self.frame.size)
        color.setFill()
        UIBezierPath(rect: self.frame).fill()
        let bgImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.setSearchFieldBackgroundImage(bgImage, for: .normal)
    }
}

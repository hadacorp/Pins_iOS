//
//  UIScreenSize.swift
//  Pins
//
//  Created by judongseok on 2022/01/12.
//

import UIKit


class UIScreenSize {
    static let shared = UIScreenSize()

    var width: CGFloat?
    var height: CGFloat?
    
    private init() {
        self.width = UIScreen.main.bounds.width
        self.height = UIScreen.main.bounds.height
    }
}

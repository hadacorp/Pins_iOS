//
//  UIScreenSize.swift
//  Pins
//
//  Created by judongseok on 2022/01/12.
//

import UIKit


class UIScreenSize {
    static let shared = UIScreenSize()

    var width: CGFloat
    var height: CGFloat
    var safeHeight: CGFloat
    
    private init() {
        let scenes = UIApplication.shared.connectedScenes
        let windowScenes = scenes.first as? UIWindowScene
        let window = windowScenes?.windows.first
        
        let topPadding = window!.safeAreaInsets.top
        let bottomPadding = window!.safeAreaInsets.bottom
        
        self.width = UIScreen.main.bounds.width
        self.height = UIScreen.main.bounds.height
        self.safeHeight = UIScreen.main.bounds.height - (topPadding + bottomPadding)
    }
}

//
//  JoinBackgroundView.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit

class JoinBackgroundView {
    // join head lable
    private let joinHeadLableView = JoinHeadLabelView()
    var background = UIView()
    
    func initial(parent: UIView, constraint: UIView){
        parent.addSubview(background)
        
        background.snp.makeConstraints { (bg) in
            bg.bottom.equalTo(constraint).offset(171)
            bg.leading.equalTo(0)
            bg.height.equalTo(172)
            bg.width.equalTo(constraint)
        }
        background.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9450980392, blue: 0.9647058824, alpha: 1)
        
        joinHeadLableView.initial(parent: background)
    }
}

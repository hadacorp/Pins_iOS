//
//  MyPinBackground.swift
//  Pins
//
//  Created by judongseok on 2021/08/03.
//

import UIKit

class MyPinBackgroundView {
    let myPinHeadLabelView = MyPinHeadLabelView()
    let myPinBtnAllView = MyPinBtnAllView()
    
    let background = UIView()
    func initial(parent: UIView, constraint: UIView){
        parent.addSubview(background)
        print(background)
        background.snp.makeConstraints { (bg) in
            bg.leading.equalTo(constraint).offset(0)
            bg.top.equalTo(constraint).offset(132)
            bg.height.equalTo(420)
            bg.width.equalTo(constraint)
        }
        
        background.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        
        myPinHeadLabelView.initial(parent: background)
        myPinBtnAllView.initial(parent: background)
    }
}

//
//  MyPinHeadLabelView.swift
//  Pins
//
//  Created by judongseok on 2021/08/03.
//

import UIKit

class MyPinHeadLabelView {
    let headLabel = UILabel()
    
    func initial(parent: UIView){
        parent.addSubview(headLabel)
        
        headLabel.snp.makeConstraints { (label) in
            label.top.equalTo(parent).offset(14)
            label.leading.equalTo(parent).offset(16)
        }
        
        headLabel.font = UIFont(name: "NotoSansKR-Bold", size: 18)
        headLabel.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        headLabel.text = "내가 찍은 핀!"
    }
}

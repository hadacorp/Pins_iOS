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
    
    init(frame: CGSize, radius: CGFloat, color: UIColor, background: UIView) {
        background.addSubview(button)
        
        button.snp.makeConstraints { (bt) in
            // 따로 빼서 적용시켜주기
            bt.top.equalTo(background).offset(150)
            bt.trailing.equalTo(background).offset(-20)
            
            bt.width.equalTo(frame.width)
            bt.height.equalTo(frame.height)
        }
        
        button.backgroundColor = color
        button.layer.cornerRadius = radius
    }
}

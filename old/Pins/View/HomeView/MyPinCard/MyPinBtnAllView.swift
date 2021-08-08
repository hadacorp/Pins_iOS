//
//  MyPinBtnAllView.swift
//  Pins
//
//  Created by judongseok on 2021/08/03.
//

import UIKit

class MyPinBtnAllView{
    let allButton = UIImageView()
    
    func initial(parent: UIView){
        parent.addSubview(allButton)
        
        allButton.snp.makeConstraints { btn in
            btn.top.equalTo(parent).offset(14)
            btn.trailing.equalTo(parent).offset(-16)
            btn.width.equalTo(68)
            btn.height.equalTo(28)
        }
        
        allButton.image = #imageLiteral(resourceName: "buttonViewAll")
    }
}

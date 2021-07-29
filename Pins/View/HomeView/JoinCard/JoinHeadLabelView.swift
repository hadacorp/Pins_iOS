//
//  JoinHeadLabelView.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit

class JoinHeadLabelView {
    private var label = UILabel()
    
    func initial(parent: UIView){
        parent.addSubview(label)
        label.snp.makeConstraints { (label) in
            label.top.equalTo(14)
            label.leading.equalTo(16)
        }
        label.text = "참가 신청한 핀"
        label.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 18)
    }
}

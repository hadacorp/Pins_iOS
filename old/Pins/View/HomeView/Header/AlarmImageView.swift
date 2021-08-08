//
//  AlarmImageView.swift
//  Pins
//
//  Created by judongseok on 2021/08/01.
//

import UIKit

class AlarmImageView {
    func initial(parent: UIView){
        let alarm = UIImageView(image: UIImage(named: "alarm"))
        parent.addSubview(alarm)
        
        alarm.snp.makeConstraints { (alarm) in
            alarm.top.equalTo(0)
            alarm.trailing.equalTo(2)
            alarm.height.width.equalTo(48)
        }
    }
}

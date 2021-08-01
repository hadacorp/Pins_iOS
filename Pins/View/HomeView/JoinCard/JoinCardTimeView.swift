//
//  JoinCardTimeView.swift
//  Pins
//
//  Created by judongseok on 2021/08/01.
//

import UIKit

class JoinCardTimeView {
    func initial(card: JoinCardModel, background: UIView){
        card.time.snp.makeConstraints { (time) in
            time.leading.equalTo(background).offset(8)
            time.top.equalTo(background).offset(73)
        }
        card.time.textColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
        card.time.font = UIFont(name: "NotoSansKR-Regular", size: 13)
    }
}

//
//  PromiseCardTimeView.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit

class PromiseCardTimeView {
    func initial(card: PromiseCardModel, background: UIView){
        card.time.snp.makeConstraints { (time) in
            time.centerX.equalTo(background)
            time.top.equalTo(181)
        }
        card.time.textColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
        card.time.font = UIFont(name: "NotoSansKR-Regular", size: 13)
    }
}

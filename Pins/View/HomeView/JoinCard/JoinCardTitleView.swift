//
//  JoinCardTitleView.swift
//  Pins
//
//  Created by judongseok on 2021/08/01.
//

import UIKit

class JoinCardTitleView {
    func initial(card: JoinCardModel, background: UIView){
        card.title.snp.makeConstraints { (title) in
            title.leading.equalTo(background).offset(8)
            title.top.equalTo(background).offset(28)
        }
        card.title.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        card.title.font = UIFont(name: "NotoSansKR-Medium", size: 14)
    }
}

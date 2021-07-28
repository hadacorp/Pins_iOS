//
//  PromiseCardTitleView.swift
//  Pins
//
//  Created by judongseok on 2021/07/28.
//

import UIKit
import SnapKit

class PromiseCardTitleView {
    func initial(card: PromiseCardModel, background: UIView){
        card.title.snp.makeConstraints { (title) in
            title.width.equalTo(148)
            title.height.equalTo(60)
            title.top.equalTo(99)
            title.centerX.equalTo(background)
        }
        card.title.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        card.title.numberOfLines = 2
        card.title.textAlignment = .center
        card.title.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
    }
}

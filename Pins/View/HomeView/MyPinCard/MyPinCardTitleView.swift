//
//  MyPinCardTitleView.swift
//  Pins
//
//  Created by judongseok on 2021/08/04.
//

import UIKit

class MyPinCardTitleView {
    func initial(card: MyPinCardModel, background: UIView, isImage: Bool){
        card.title.snp.makeConstraints { (title) in
            if isImage{
                title.trailing.equalTo(background).offset(-109)
            }
            else{
                title.trailing.equalTo(background).offset(-8)
            }
            title.top.equalTo(background).offset(28)
            title.leading.equalTo(background).offset(8)
        }
        card.title.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        card.title.numberOfLines = 2
        card.title.textAlignment = .left
        card.title.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
    }
}

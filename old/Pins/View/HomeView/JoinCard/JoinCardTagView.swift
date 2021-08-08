//
//  JoinCardTagView.swift
//  Pins
//
//  Created by judongseok on 2021/08/01.
//

import UIKit

class JoinCardTagView {
    func initial(card: JoinCardModel, background: UIView){
        card.tag.snp.makeConstraints { (tag) in
            tag.leading.equalTo(background).offset(32)
            tag.top.equalTo(background).offset(6)
            tag.height.equalTo(19)
        }
        card.tag.textColor = #colorLiteral(red: 0.0431372549, green: 0.6392156863, blue: 0.8705882353, alpha: 1)
        card.tag.font = UIFont(name: "NotoSansKR-Regular", size: 13)
    }
}

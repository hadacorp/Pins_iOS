//
//  PromiseCardTagView.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit
import SnapKit

class PromiseCardTagView {
    func initial(card: PromiseCardModel, background: UIView){
        card.tag.snp.makeConstraints { (tag) in
            tag.leading.equalTo(30)
            tag.top.equalTo(6)
        }
        card.tag.textColor = #colorLiteral(red: 0.0431372549, green: 0.6392156863, blue: 0.8705882353, alpha: 1)
        card.tag.font = UIFont(name: "NotoSansKR-Regular", size: 13)
    }
}

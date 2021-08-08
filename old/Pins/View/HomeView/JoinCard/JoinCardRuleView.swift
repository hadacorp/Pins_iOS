//
//  JoinCardRuleView.swift
//  Pins
//
//  Created by judongseok on 2021/08/03.
//

import UIKit

class JoinCardRuleView {
    func initial(card: JoinCardModel, background: UIView){
        card.rule.snp.makeConstraints { (rule) in
            rule.top.equalTo(background).offset(73)
            rule.trailing.equalTo(background).offset(-108)
        }
        card.rule.textColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
        card.rule.font = UIFont(name: "NotoSansKR-Regular", size: 13)
    }
}

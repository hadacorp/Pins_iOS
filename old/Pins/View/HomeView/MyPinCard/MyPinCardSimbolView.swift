//
//  MyPinCardSimbolView.swift
//  Pins
//
//  Created by judongseok on 2021/08/03.
//

import UIKit

class MyPinCardSimbolView {
    func initial(card: MyPinCardModel, background: UIView, image: UIImage){
        card.simbol.snp.makeConstraints { simbol in
            simbol.leading.equalTo(background).offset(8)
            simbol.top.equalTo(background).offset(6)
            simbol.width.height.equalTo(20)
        }
        card.simbol.image = image
    }
}

//
//  MyPinCardBackground.swift
//  Pins
//
//  Created by judongseok on 2021/08/03.
//

import UIKit

class MyPinCardBackground {
    let myPinCardTagView = MyPinCardTagView()
    let myPinCardSimbolView = MyPinCardSimbolView()
    let background = UIView()
    
    func initial(parent: UIView, index: Int, category: Int, card: MyPinCardModel){
        parent.addSubview(background)
        let value: Int = 56 + (112 * index)
        background.snp.makeConstraints { (bg) in
            bg.top.equalTo(value)
            bg.leading.equalTo(16)
            bg.width.equalTo(UIScreen.main.bounds.width - 32)
            bg.height.equalTo(100)
        }
        background.layer.cornerRadius = 8
        background.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        background.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), alpha: 0.08, x: 0, y: 8, blur: 16, spread: 0)
        
        parent.addSubview(card.simbol)
        parent.addSubview(card.tag)
        // 공통으로 생성하는 뷰
        myPinCardTagView.initial(card: card, background: background)
        
        // array[i] 하면 해당 category가 나옴
        // 0: 모임핀, 1: 커뮤니티핀, 2: 이야기핀
        switch category {
        case 0:
            print("모임핀 생성")
            myPinCardSimbolView.initial(card: card, background: background, image: #imageLiteral(resourceName: "simbolPin"))
        case 1:
            print("커뮤니티핀 생성")
            myPinCardSimbolView.initial(card: card, background: background, image: #imageLiteral(resourceName: "simbolCommunity"))
        case 2:
            print("이야기핀 생성")
            myPinCardSimbolView.initial(card: card, background: background, image: #imageLiteral(resourceName: "simbolTalk"))
        default:
            print("error")
        }
    }
}

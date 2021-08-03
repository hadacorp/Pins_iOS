//
//  MyPinBackground.swift
//  Pins
//
//  Created by judongseok on 2021/08/03.
//

import UIKit

class MyPinBackgroundView {
    let myPinHeadLabelView = MyPinHeadLabelView()
    let myPinBtnAllView = MyPinBtnAllView()
    var myPinCardBackground: [MyPinCardBackground] = []
    
    let background = UIView()
    func initial(parent: UIView, constraint: UIView, array: [Int], cardList: [MyPinCardModel]){
        parent.addSubview(background)
        background.snp.makeConstraints { (bg) in
            bg.leading.equalTo(constraint).offset(0)
            bg.top.equalTo(constraint).offset(132)
            bg.height.equalTo(420)
            bg.width.equalTo(constraint)
        }
        
        background.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        addSubCardVIew(parent: background, array: array, cardList: cardList)
    }
    
    func addSubCardVIew(parent: UIView, array: [Int], cardList: [MyPinCardModel]){
        myPinHeadLabelView.initial(parent: parent)
        myPinBtnAllView.initial(parent: parent)
        
        for i in 0 ..< array.count{
            let temp = MyPinCardBackground()
            temp.initial(parent: parent, index: i, category: array[i], card: cardList[i])
            myPinCardBackground.append(temp)
        }
    }
}

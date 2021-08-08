//
//  MyPinCardView.swift
//  Pins
//
//  Created by judongseok on 2021/08/03.
//

import UIKit

class MyPinCardView {
    let myPinBackgroundView = MyPinBackgroundView()
    
    func initial(parent: UIView, constraint: UIView, array: [Int], cardList: [MyPinCardModel]){
        myPinBackgroundView.initial(parent: parent, constraint: constraint, array: array, cardList: cardList)
    }
}

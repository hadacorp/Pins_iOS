//
//  CardDetailViewModel.swift
//  Pins
//
//  Created by judongseok on 2022/02/19.
//

import Foundation

class CardDetailViewModel {
    let tempArr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
    
    var card: CardInfo = CardInfo(name: "", age: "", category: "", title: "", position: "", time: "", ageRange: "", gender: "")
    
    var isJoinHidden: Bool = true
    
    func getTempArrCount() -> Int {
        return tempArr.count
    }
}

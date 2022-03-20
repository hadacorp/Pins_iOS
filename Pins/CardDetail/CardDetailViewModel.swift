//
//  CardDetailViewModel.swift
//  Pins
//
//  Created by judongseok on 2022/02/19.
//

import Foundation

class CardDetailViewModel {
    let tempArr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
    
    var card: CardInfo = CardInfo(type: "", name: "", age: "", category: "", title: "", position: "", time: "", ageRange: "", gender: "")
    
    var isJoinHidden: Bool = true
    
    func getCardType() -> String {
        if card.type == "Meeting" {
            return "만남 핀"
        }
        else if card.type == "Story" {
            return "이야기 핀"
        }
        else if card.type == "Community" {
            return "커뮤니티 핀"
        }
        return ""
    }
    
    func getTempArrCount() -> Int {
        return tempArr.count
    }
}

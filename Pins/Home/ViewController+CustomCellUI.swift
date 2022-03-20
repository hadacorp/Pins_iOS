//
//  ViewController+CustomCellUI.swift
//  Pins
//
//  Created by judongseok on 2022/02/19.
//

import UIKit

extension ViewController {
    func initCellUI(parent: UIView, card: CardInfo) {
        if card.type == "Meeting" {
            initMeeting(parent: parent, card: card)
        }
        else if card.type == "Story" {
            initStory(parent: parent, card: card)
        }
        else if card.type == "Community" {
            initCommunity(parent: parent, card: card)
        }
    }
    func initBase(parent: UIView, card: CardInfo) {
        CustomLabel(parent: parent)
            .makeConstraints {
                $0.top.equalTo(18)
                $0.leading.equalTo(59)
                $0.height.equalTo(14)
            }
            .setText(text: card.name)
            .setFont(name: "NotoSansKR-Regular", size: 13)
        
        CustomImage(parent: parent)
            .makeConstraints {
                $0.top.equalTo(18)
                $0.leading.equalTo(16)
                $0.width.height.equalTo(35)
            }
            .setImage(image: UIImage(named: "catimage")!)
            .setRadius(size: 17)
        
        CustomLabel(parent: parent)
            .makeConstraints {
                $0.top.equalTo(40)
                $0.leading.equalTo(59)
                $0.height.equalTo(13)
            }
            .setText(text: card.age)
            .setFont(name: "NotoSansKR-Regular", size: 13)
            .setColor(color: UIColor.init(hex: "#999999"))
        
        CustomLabel(parent: parent)
            .makeConstraints {
                $0.top.equalTo(18)
                $0.trailing.equalTo(-16)
                $0.height.equalTo(19)
                $0.width.equalTo(Category().accident)
            }
            .setFont(name: "NotoSansKR-Regular", size: 12)
            .setText(text: card.category)
            .setBackgroundColor(color: UIColor.init(hex: "#1059FF"))
            .setColor(color: .white)
            .setRadius(size: 10)
            .setAlignment(alignment: .center)
        
        CustomLabel(parent: parent)
            .makeConstraints {
                $0.top.equalTo(75)
                $0.leading.equalTo(16)
                $0.trailing.equalTo(-16)
            }
            .setText(text: card.title)
            .setFont(name: "NotoSansKR-Regular", size: 15)
            .setLineHeight(size: 2)
    }
    
    func initCommunity(parent: UIView, card: CardInfo) {
        initBase(parent: parent, card: card)
        
        CustomImage(parent: parent)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.bottom.equalTo(-23)
            }
            .setImage(image: UIImage(named: "iconPeople")!)
        
        CustomLabel(parent: parent)
            .makeConstraints {
                $0.leading.equalTo(37)
                $0.bottom.equalTo(-23)
            }
            .setText(text: card.people ?? "")
            .setFont(name: "NotoSansKR-Regular", size: 13)
            .setColor(color: UIColor.init(hex: "#999999"))
    }
    
    func initStory(parent: UIView, card: CardInfo) {
        initBase(parent: parent, card: card)
        
        CustomImage(parent: parent)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.bottom.equalTo(-23)
            }
            .setImage(image: UIImage(named: "iconComment")!)
        
        CustomLabel(parent: parent)
            .makeConstraints {
                $0.leading.equalTo(37)
                $0.bottom.equalTo(-23)
            }
            .setText(text: card.comment ?? "")
            .setFont(name: "NotoSansKR-Regular", size: 13)
            .setColor(color: UIColor.init(hex: "#999999"))
    }
    func initMeeting(parent: UIView, card: CardInfo) {
        initBase(parent: parent, card: card)
        
        CustomImage(parent: parent)
            .makeConstraints {
                $0.bottom.equalTo(-22)
                $0.leading.equalTo(16)
                $0.width.equalTo(14)
                $0.height.equalTo(14)
            }
            .setImage(image: UIImage(named: "iconCalendar")!)
        
        CustomLabel(parent: parent)
            .makeConstraints {
                $0.leading.equalTo(37)
                $0.bottom.equalTo(-22)
                $0.height.equalTo(14)
            }
            .setText(text: card.time)
            .setFont(name: "NotoSansKR-Regular", size: 13)
            .setColor(color: UIColor.init(hex: "#999999"))
        
        CustomImage(parent: parent)
            .makeConstraints {
                $0.leading.equalTo(206)
                $0.bottom.equalTo(-22)
                $0.width.equalTo(11)
                $0.height.equalTo(13)
            }
            .setImage(image: UIImage(named: "iconPeople")!)
        
        CustomLabel(parent: parent)
            .makeConstraints {
                $0.leading.equalTo(224)
                $0.bottom.equalTo(-22)
                $0.height.equalTo(14)
            }
            .setText(text: "0/1")
            .setFont(name: "NotoSansKR-Regular", size: 13)
            .setColor(color: UIColor.init(hex: "#999999"))
    }
}

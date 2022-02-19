//
//  ViewController+CustomCellUI.swift
//  Pins
//
//  Created by judongseok on 2022/02/19.
//

import UIKit

extension ViewController {
    func initCellUI(parent: UIView) {
        CustomLabel(parent: parent)
            .makeConstraints {
                $0.top.equalTo(18)
                $0.leading.equalTo(59)
                $0.height.equalTo(14)
            }
            .setText(text: "가나다라마바사")
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
            .setText(text: "23살 여자")
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
            .setText(text: "사건사고")
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
            .setText(text: "광교호수공원에서 강아지 산책해용 저는 말티즈 키우고 있어용 제가 자주 가는 코스로 모셔볼게 용가리어카센타이어부자식칼국수제비")
            .setFont(name: "NotoSansKR-Regular", size: 15)
            .setLineHeight(size: 2)
        
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
            .setText(text: "이번주 금요일 오후 2시 05분")
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

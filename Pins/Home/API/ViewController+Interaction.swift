//
//  ViewController+Interaction.swift
//  Pins
//
//  Created by judongseok on 2022/03/26.
//

import UIKit

extension ViewController {
    func interactionUI() {
        interactionBackground = CustomView(parent: mapView)
            .setColor(color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.55 ))
            .makeConstraints {
                $0.top.leading.equalTo(0)
                $0.width.equalTo(self.mapView)
                $0.height.equalTo(self.mapView)
            }
            .setHidden(hidden: true)
            
        interactionCancel = CustomButton(parent: interactionBackground)
            .setColor(color: UIColor.white.cgColor)
            .setOpacity(opacity: 0.9)
            .makeConstraints { [self] in
                $0.width.height.equalTo(50)
                $0.bottom.equalTo(-14 - UIScreenSize.shared.bottomPadding)
                $0.centerX.equalTo(interactionBackground)
            }
            .setImage(image: UIImage.init(named: "cancel")!)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: CGColor.init(red: 0, green: 0, blue: 0, alpha: 1))
            .setRounded(size: 20)
        
        let joinPin = CustomButton(parent: interactionBackground)
            .setColor(color: UIColor.init(hex: "1059FF").cgColor)
            .setOpacity(opacity: 0.9)
            .makeConstraints {
                $0.leading.equalTo(56)
                $0.bottom.equalTo(-117 - UIScreenSize.shared.bottomPadding)
                $0.width.height.equalTo(50)
            }
            .setImage(image: UIImage.init(named: "pinImage")!)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: CGColor.init(red: 0, green: 0, blue: 0, alpha: 1))
            .setRounded(size: 20)
        
        let makePin = CustomButton(parent: interactionBackground)
            .setColor(color: UIColor.init(hex: "1059FF").cgColor)
            .setOpacity(opacity: 0.9)
            .makeConstraints {
                $0.trailing.equalTo(-56)
                $0.bottom.equalTo(-117 - UIScreenSize.shared.bottomPadding)
                $0.width.height.equalTo(50)
            }
            .setImage(image: UIImage.init(named: "pinImage")!)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: CGColor.init(red: 0, green: 0, blue: 0, alpha: 1))
            .setRounded(size: 20)
        
        let menu = CustomButton(parent: interactionBackground)
            .setColor(color: UIColor.init(hex: "1059FF").cgColor)
            .setOpacity(opacity: 0.9)
            .makeConstraints { [self] in
                $0.centerX.equalTo(interactionBackground)
                $0.bottom.equalTo(-167 - UIScreenSize.shared.bottomPadding)
                $0.width.height.equalTo(50)
            }
            .setImage(image: UIImage.init(named: "pinImage")!)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: CGColor.init(red: 0, green: 0, blue: 0, alpha: 1))
            .setRounded(size: 20)
        
        CustomLabel(parent: joinPin)
            .setText(text: "참가한핀")
            .setColor(color: .white)
            .setFont(name: "NotoSansKR-Regular", size: 12)
            .makeConstraints {
                $0.centerX.equalTo(joinPin)
                $0.top.equalTo(joinPin.snp.bottom).offset(4)
            }
        
        CustomLabel(parent: makePin)
            .setText(text: "핀만들기")
            .setColor(color: .white)
            .setFont(name: "NotoSansKR-Regular", size: 12)
            .makeConstraints {
                $0.centerX.equalTo(makePin)
                $0.top.equalTo(makePin.snp.bottom).offset(4)
            }
        
        CustomLabel(parent: menu)
            .setText(text: "마이메뉴")
            .setColor(color: .white)
            .setFont(name: "NotoSansKR-Regular", size: 12)
            .makeConstraints {
                $0.centerX.equalTo(menu)
                $0.top.equalTo(menu.snp.bottom).offset(4)
            }
    }
}

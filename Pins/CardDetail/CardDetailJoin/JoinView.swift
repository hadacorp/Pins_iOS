//
//  JoinViewController.swift
//  Pins
//
//  Created by judongseok on 2022/03/07.
//

import Foundation
import UIKit

extension CardDetailViewController {
    
    func setJoinView() {
        joinBackground = CustomView(parent: self.view)
            .makeConstraints {
                $0.top.leading.trailing.bottom.equalTo(0)
            }
            .setColor(color: UIColor.init(_colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.4))
            .setHidden(hidden: viewModel.isJoinHidden)
        
        whiteCard = CustomView(parent: joinBackground)
            .makeConstraints {
                $0.bottom.equalTo(self.view.safeAreaInsets).offset(-224)
                $0.leading.equalTo(16)
                $0.trailing.equalTo(-16)
                $0.height.equalTo(296)
            }
            .setColor(color: .white)
            .setRadius(size: 20)
        
        CustomLabel(parent: whiteCard)
            .makeConstraints {
                $0.top.equalTo(16)
                $0.leading.equalTo(16)
            }
            .setText(text: "첫인사를 작성해요")
            .setFont(name: "NotoSansKR-Regular", size: 18)
        
        CustomTextView(parent: whiteCard)
            .makeConstraints {
                $0.top.equalTo(58)
                $0.leading.equalTo(16)
                $0.trailing.equalTo(-16)
                $0.bottom.equalTo(-136)
            }
            .setColor(color: UIColor.init(hex: "EEEEEE"))
            .setRounded(size: 15)
            .setCursorColor(color: UIColor(hex: "000000"))
            .setFont(name: "NotoSansKR-Regular", size: 16)
            .setPadding(padding: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 0))
            .setPlaceholder(string: "최대 50자", parent: self)
        
        CustomLabel(parent: whiteCard)
            .makeConstraints {
                $0.top.equalTo(176)
                $0.leading.equalTo(16)
            }
            .setColor(color: UIColor.init(hex: "1059FF"))
            .setText(text: "작성 후엔 수정할 수 없으니 신중하게 :)")
            .setFont(name: "NotoSansKR-Regular", size: 14)
        
        CustomLabel(parent: whiteCard)
            .makeConstraints {
                $0.top.equalTo(196)
                $0.leading.equalTo(16)
            }
            .setColor(color: .black)
            .setText(text: "핀 주인이 확인할 때까지 조금만 기다려봐요!")
            .setFont(name: "NotoSansKR-Regular", size: 14)
        
        cancelBtn = CustomButton(parent: whiteCard)
            .makeConstraints {
                $0.top.equalTo(240)
                $0.trailing.equalTo(-126)
                $0.width.equalTo(74)
                $0.height.equalTo(40)
            }
            .setRounded(size: 15)
            .setColor(color: UIColor.init(hex: "EEEEEE").cgColor)
            .setTitle(title: "취소")
            .setTitleFont(name: "NotoSansKR-Regular", size: 15)
            .setTitleColor(color: .black)
        
        applyBtn = CustomButton(parent: whiteCard)
            .makeConstraints {
                $0.top.equalTo(240)
                $0.trailing.equalTo(-16)
                $0.width.equalTo(102)
                $0.height.equalTo(40)
            }
            .setRounded(size: 15)
            .setColor(color: UIColor.init(hex: "1059FF").cgColor)
            .setTitle(title: "신청하기")
            .setTitleFont(name: "NotoSansKR-Regular", size: 15)
            .setTitleColor(color: .white)
    }
}

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
        let background = CustomView(parent: self.view)
            .makeConstraints {
                $0.top.leading.trailing.bottom.equalTo(0)
            }
            .setColor(color: UIColor.init(_colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.4))
        
        let white = CustomView(parent: background)
            .makeConstraints {
                $0.top.equalTo(self.view.safeAreaInsets).offset(214)
                $0.leading.equalTo(16)
                $0.trailing.equalTo(-16)
                $0.height.equalTo(296)
            }
            .setColor(color: .white)
            .setRadius(size: 20)
        
        CustomLabel(parent: white)
            .makeConstraints {
                $0.top.equalTo(16)
                $0.leading.equalTo(16)
            }
            .setText(text: "첫인사를 작성해요")
            .setFont(name: "NotoSansKR-Regular", size: 18)
        
        CustomTextView(parent: white)
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
    }
}

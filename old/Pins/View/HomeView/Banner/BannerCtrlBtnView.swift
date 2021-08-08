//
//  BannerCtrlBtnView.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit

class BannerCtrlBtnView {
    func initial(parent: UIView, list: [BannerCtrlBtnModel], anchor: UICollectionView){
        for i in 0 ..< list.count {
            // 시작될 중심 값
            let positionX = (parent.frame.width / 2) + CGFloat(21 * i)
            // 앞으로 당길 값
            let leadingMinus = (CGFloat(13 * list.count) + CGFloat(8 * CGFloat(list.count - 1))) / 2
            
            parent.addSubview(list[i].button)
            list[i].button.snp.makeConstraints { (button) in
                button.bottom.equalTo(anchor).offset(-8)
                button.height.equalTo(8)
                button.width.equalTo(13)
                button.leading.equalTo(positionX - leadingMinus)
            }
        }
    }
}

//
//  PromiseCardThumbnailView.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit

class PromiseCardThumbnailView {
    func initial(card: PromiseCardModel, background: UIView){
        card.thumbnail.snp.makeConstraints { (thumbnail) in
            thumbnail.width.height.equalTo(60)
            thumbnail.top.equalTo(31)
            thumbnail.centerX.equalTo(background)
        }
        let maskView = UIImageView(image: UIImage(named: "profileMask"))
        card.thumbnail.mask = maskView
    }
}

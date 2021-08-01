//
//  JoinCardThumbnailView.swift
//  Pins
//
//  Created by judongseok on 2021/08/02.
//

import UIKit

class JoinCardThumbnailView {
    func initial(card: JoinCardModel, background: UIView){
        card.thumbnail.snp.makeConstraints { (thumbnail) in
            thumbnail.width.height.equalTo(84)
            thumbnail.centerY.equalTo(background)
            thumbnail.trailing.equalTo(background).offset(-8)
        }
        let maskView = UIImageView(image: UIImage(named: "profileMask")?.resizeImage(targetSize: CGSize(width: 84, height: 84)))
        card.thumbnail.mask = maskView
    }
}



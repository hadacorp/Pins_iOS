//
//  ThumbnailImg.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/14.
//

import UIKit

class ThumbnailImg {
    var image = UIImageView()
    
    init(frame: CGSize, mask: UIImage?, src: UIImage, background: UIView) {
        background.addSubview(image)
        image.snp.makeConstraints { (bt) in
            // 따로 빼서 적용시켜주기
            bt.width.equalTo(frame.width)
            bt.height.equalTo(frame.height)
        }
        
        image.image = src
        if mask != nil{
            let maskView = UIImageView(image: mask)
            image.mask = maskView
        }
    }
}

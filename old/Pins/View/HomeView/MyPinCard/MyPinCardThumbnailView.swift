//
//  MyPinCardThumbnailView.swift
//  Pins
//
//  Created by judongseok on 2021/08/05.
//

import UIKit

class MyPinCardThumbnailView {
    func initial(card: MyPinCardModel, background: UIView){
        if card.category == 0{
            card.thumbnail!.snp.makeConstraints { (bg) in
                bg.width.height.equalTo(84)
                bg.top.equalTo(background).offset(8)
                bg.trailing.equalTo(background).offset(-8)
            }
            let maskView = UIImageView(image: UIImage(named: "profileMask")?.resizeImage(targetSize: CGSize(width: 84, height: 84)))
            card.thumbnail?.mask = maskView
        }
        else if card.category == 1{
            if card.thumbnail != nil{
                card.thumbnail!.snp.makeConstraints { (bg) in
                    bg.width.height.equalTo(100)
                    bg.top.equalTo(background).offset(0)
                    bg.trailing.equalTo(background).offset(0)
                }
            }
        }
        else if card.category == 2{
            if card.thumbnail != nil{
                card.thumbnail!.snp.makeConstraints { (bg) in
                    bg.width.height.equalTo(100)
                    bg.top.equalTo(background).offset(0)
                    bg.trailing.equalTo(background).offset(0)
                }
            }
        }
    }
}

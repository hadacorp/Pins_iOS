//
//  PromiseCardModel.swift
//  Pins
//
//  Created by judongseok on 2021/07/26.
//

import UIKit

// 약속 스크롤 뷰에 보여줄 카드 뷰
class PromiseCardModel {
    let simbolPin: UIImageView = UIImageView(image: #imageLiteral(resourceName: "simbolPin"))
    let tag = UILabel()
    let thumbnail: UIImageView
    var title = UILabel()
    var time = UILabel()
    
    init(tag: String, thumbnail: UIImageView, title: String, time: String) {
        self.tag.text = tag
        self.thumbnail = thumbnail
        self.title.text = title
        self.time.text = time
    }
}

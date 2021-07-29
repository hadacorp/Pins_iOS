//
//  JoinCardModel.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit

class JoinCardModel {
    let simbolPin: UIImageView = UIImageView(image: #imageLiteral(resourceName: "simbolPin"))
    let tag = UILabel()
    let thumbnail: UIImageView
    let title = UILabel()
    let time = UILabel()
    let rule = UILabel()
    
    init(tag: String, thumbnail: UIImageView, title: String, time: String, rule: String) {
        self.tag.text = tag
        self.thumbnail = thumbnail
        self.title.text = title
        self.time.text = time
        self.rule.text = rule
    }
}

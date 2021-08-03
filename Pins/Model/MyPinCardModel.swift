//
//  MyPinCardModel.swift
//  Pins
//
//  Created by judongseok on 2021/08/03.
//

import UIKit

class MyPinCardModel {
    // 공통 요소
    var simbol: UIImageView = UIImageView(image: #imageLiteral(resourceName: "simbolPin"))
    let tag = UILabel()
    let title = UILabel()
    // 모임핀과 커뮤니티핀 요소
    let rule = UILabel()
    // 커뮤니티 핀 요소
    let member = UILabel()
    // 모임핀 요소
    let time = UILabel()
    // 옵셔널 요소
    let thumbnail: UIImageView?
    // 이야기핀 요소
    let commentImage: UIImageView = UIImageView(image: #imageLiteral(resourceName: "iconComment"))
    var commentText: UILabel?
    let likeImage: UIImageView = UIImageView(image: #imageLiteral(resourceName: "iconLike"))
    var likeText: UILabel?
    // 유형
    var category: Int
    
    // 모임핀 init
    init(simbol: UIImageView, tag: String, thumbnail: UIImageView, title: String, time: String, rule: String, category: Int) {
        self.simbol = simbol
        self.tag.text = tag
        self.thumbnail = thumbnail
        self.title.text = title
        self.time.text = time
        self.rule.text = rule
        self.category = category
    }
    // 커뮤니티 핀
    init(simbol: UIImageView, tag: String, thumbnail: UIImageView, title: String, member: String, rule: String, category: Int) {
        self.simbol = simbol
        self.tag.text = tag
        self.thumbnail = thumbnail
        self.title.text = title
        self.member.text = member
        self.rule.text = rule
        self.category = category
    }
    // 이야기핀
    init(simbol: UIImageView, tag: String, thumbnail: UIImageView, title: String, commentText: UILabel?, likeText: UILabel?, category: Int) {
        self.simbol = simbol
        self.tag.text = tag
        self.thumbnail = thumbnail
        self.title.text = title
        self.commentText = commentText!
        self.likeText = likeText!
        self.category = category
    }
}

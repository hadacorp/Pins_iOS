//
//  BannerImageModel.swift
//  Pins
//
//  Created by judongseok on 2021/07/22.
//

import UIKit

// 배너에 띄워줄 이미지 모델 클래스
class BannerImageModel{
    // image name
    let name: String
    
    // UIImage
    var image: UIImage?{
        return UIImage(named: "\(name)")
    }
    
    init(name: String) {
        self.name = name
    }
}

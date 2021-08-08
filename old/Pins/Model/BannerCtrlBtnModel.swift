//
//  BannerCtrlBtnModel.swift
//  Pins
//
//  Created by judongseok on 2021/07/22.
//

import UIKit

class BannerCtrlBtnModel {
    // 버튼 사이즈
    let frameSize: CGRect
    // 클릭 됐는지 확인
    let isClick: Bool = false
    
    var button = UIButton()
    
    init(frameSize: CGRect) {
        self.frameSize = frameSize
    }
}

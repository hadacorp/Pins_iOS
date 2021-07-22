//
//  MainViewModel.swift
//  Pins
//
//  Created by judongseok on 2021/07/22.
//

import UIKit

class MainViewModel {
    // 배너 이미지 리스트
    let bannerImageList: [BannerImageModel] = [
        BannerImageModel(name: "mainBanner"),
        BannerImageModel(name: "mainBanner"),
        BannerImageModel(name: "mainBanner"),
        BannerImageModel(name: "mainBanner"),
        BannerImageModel(name: "mainBanner")
    ]
    
    var bannerCtrlBtnList: [BannerCtrlBtnModel] = []
    
    var numOfBannerBtnList: Int{
        return bannerCtrlBtnList.count
    }
    
    var numOfBannerImageList: Int{
        return bannerImageList.count
    }
    
    // 배너 컨트롤 버튼 init
    func initBannerCtrlBtnList(){
        for i in 0 ..< bannerImageList.count {
            let btn = BannerCtrlBtnModel(frameSize: CGRect(x: 0 + (i * 21), y: 300, width: 13, height: 8))
            btn.button.frame = btn.frameSize
            btn.button.layer.cornerRadius = 4
            btn.button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
            bannerCtrlBtnList.append(btn)
        }
        bannerCtrlBtnList.first?.button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func changeBannerCtrlBtnBgColor(cur: Int){
        for i in 0 ..< bannerCtrlBtnList.count {
            if i == cur{
                bannerCtrlBtnList[cur].button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                bannerCtrlBtnList[i].button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
            }
        }
    }
    
    init() {
        initBannerCtrlBtnList()
    }
}

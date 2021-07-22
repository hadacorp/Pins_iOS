//
//  MainViewModel.swift
//  Pins
//
//  Created by judongseok on 2021/07/22.
//

import UIKit

class MainViewModel {
    let bannerImageList: [BannerImageModel] = [
        BannerImageModel(name: "mainBanner"),
        BannerImageModel(name: "mainBanner"),
        BannerImageModel(name: "mainBanner"),
        BannerImageModel(name: "mainBanner"),
        BannerImageModel(name: "mainBanner")
    ]
    
    var numOfBannerImageList: Int{
        return bannerImageList.count
    }
}

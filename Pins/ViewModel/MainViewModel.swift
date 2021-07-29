//
//  MainViewModel.swift
//  Pins
//
//  Created by judongseok on 2021/07/22.
//

import UIKit

class MainViewModel {
    // MARK:- Properties
    // 배너 이미지 리스트
    let bannerImageList: [BannerImageModel] = [
        BannerImageModel(name: "mainBanner"),
        BannerImageModel(name: "mainBanner"),
        BannerImageModel(name: "mainBanner"),
        BannerImageModel(name: "mainBanner"),
        BannerImageModel(name: "mainBanner")
    ]
    
    // 배너 컨트롤 버튼 리스트
    var bannerCtrlBtnList: [BannerCtrlBtnModel] = []
    
    // 약속 카드 리스트
    var promiseCardList: [PromiseCardModel] = []
    
    // 참가 신청한 핀
    var joinCardList: [JoinCardModel] = []
    
    // MARK:- Join func
    func initJoinCardList(){
        for _ in 0 ..< 5 {
            let card = JoinCardModel(tag: "등산/캠핑", thumbnail: UIImageView(image: #imageLiteral(resourceName: "park")), title: "주말 광교산 등산 모집!!", time: "7/20 화요일 14:00", rule: "남자만 8/9")
            
            joinCardList.append(card)
        }
    }
    
    var numOfJoinCardList: Int{
        return joinCardList.count
    }
    
    // MARK:- Promise func
    func initPromiseCardDesign(){
        for _ in 0 ..< 5 {
            let card = PromiseCardModel(tag: "맛집탐방", thumbnail: UIImageView(image: #imageLiteral(resourceName: "park")), title: "매운 음식 좋아하시는 분! 저랑 같이 가요", time: "7/17 토요일 12:00")
            card.simbolPin.frame = CGRect(x: 6, y: 6, width: 20, height: 20)
            
            promiseCardList.append(card)
        }
    }
    
    var numOfPromiseCardList: Int{
        return promiseCardList.count
    }
    // MARK:- Banner func
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
    // MARK:- init
    init() {
        initBannerCtrlBtnList()
        initPromiseCardDesign()
        initJoinCardList()
    }
}

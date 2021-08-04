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
    
    // 내가 찍은 핀
    var myPinCardList: [MyPinCardModel] = []
    
    // 0: 모임핀, 1: 커뮤니티핀, 2: 이야기핀
    let category: [Int] = [0, 1, 2]
    
    // MARK:- Join func
    func initJoinCardList(){
        for _ in 0 ..< 5 {
            let card = JoinCardModel(tag: "등산/캠핑", thumbnail: UIImageView(image: #imageLiteral(resourceName: "park")), title: "주말 광교산 등산 모집!!", time: "7/20 화요일 14:00", rule: "남자만 8/9")
            card.simbolPin.frame = CGRect(x: 8, y: 6, width: 20, height: 20)
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
    // MARK:- MyPin func
    func initMyPinCardList(){
        var card: MyPinCardModel? = nil
        let comment = UILabel()
        let like = UILabel()
        comment.text = "7"
        like.text = "37"
        
        for i in category {
            if i == 0{
                card = MyPinCardModel(simbol: UIImageView(image: #imageLiteral(resourceName: "simbolPin")), tag: "산책/반려동물", thumbnail: UIImageView(image: #imageLiteral(resourceName: "park")), title: "인계공원에서 강아지 산책시키실 분~", time: "7/19 월요일 14:00", rule: "여자만 0/1", category: 0)
            }
            else if i == 1{
                card = MyPinCardModel(simbol: UIImageView(image: #imageLiteral(resourceName: "simbolPin")), tag: "아파트/이웃", thumbnail: UIImageView(image: #imageLiteral(resourceName: "park")), title: "광교 프루지오 아파트 공동체 - 아파트 생활, 이웃사촌 친목", member: "맴버 157명", rule: "자유 참가", category: 1)
            }
            else if i == 2{
                card = MyPinCardModel(simbol: UIImageView(image: #imageLiteral(resourceName: "simbolPin")), tag: "분실/실종", thumbnail: nil, title: "주인 잃은 강아지를 보호하고 있어요! 연락주세요.", commentText: comment, likeText: like, category: 2)
            }
            myPinCardList.append(card!)
        }
    }
    
    func getMyPinCardcategory() -> [Int]{
        return category
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
        initMyPinCardList()
    }
}

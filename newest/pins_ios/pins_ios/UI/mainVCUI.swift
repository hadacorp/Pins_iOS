//
//  mainVCUI.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/01.
//

import UIKit

class MainVCUI {
    // MARK:- Public variable
    public var mainUI: [Any] = []
    
    // 최하단 버튼 3종
    public var chatButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), image: #imageLiteral(resourceName: "iconChatting"))
    public var menuButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), image: #imageLiteral(resourceName: "iconCommunity"))
    public var communityButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), image: #imageLiteral(resourceName: "iconMyMenu"))
    // 중상부 버튼
    public var moveButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), image: #imageLiteral(resourceName: "iconEye"))
    public var searchButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), image: #imageLiteral(resourceName: "icon"))
    public var starButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), image: #imageLiteral(resourceName: "iconFeatherStar"))
    // 핀 추가 버튼
    public var addButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 0.02745098039, green: 0.1294117647, blue: 0.337254902, alpha: 1), image: #imageLiteral(resourceName: "iconPlus"))
    // 내 위치로 이동 버튼
    public var myLocationButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), image: #imageLiteral(resourceName: "iconLocation"))
    // 그라데이션 위, 아래
    public var gradationUp = UIImageView(image: #imageLiteral(resourceName: "gradationUp"))
    public var gradationDown = UIImageView(image: #imageLiteral(resourceName: "gradationDown"))
    public var gra = UIView()
    
    // 필터 버튼
    public var filterMeet = UIButton()
    public var filterCommunity = UIButton()
    public var filterStory = UIButton()
    
    // SearchView Background
    public var searchBackground = UIView(frame: UIScreen.main.bounds)
    
    // MARK:- Init UIView
    init(parent: UIView?, layout: UILayoutGuide?) {
        if let parent = parent{
            if let layout = layout {                
//                initGradationUp(parent: parent)
//                initGradationDown(parent: parent)
                
                initsearchButton(parent: parent, layout: layout)
                initAddButton(parent: parent, layout: layout)
                initMoveButton(parent: parent, layout: layout)
                initStarButton(parent: parent, layout: layout)
                
                initCommunityButton(parent: parent)
//                initChatButton(parent: parent)
                initMenuButton(parent: parent)
                initSearchBackground(parent: parent)
                initMyLocationButton(parent: parent)
                
                initFilterMeet(parent: parent, layout: layout)
                initFilterCommunity(parent: parent, layout: layout)
                initFilterStory(parent: parent, layout: layout)
            }
        }
    }
    
    // MARK:- Private function
    // UI 생성 및 세팅
    // MARK:- Search Background
    private func initSearchBackground(parent: UIView){
        parent.addSubview(searchBackground)
        searchBackground.snp.makeConstraints { bg in
            bg.width.equalTo(UIScreen.main.bounds.width)
            bg.height.equalTo(UIScreen.main.bounds.height)
            bg.top.equalTo(-UIScreen.main.bounds.height)
        }
        searchBackground.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    // MARK:- 필터 버튼 3종
    private func initFilterMeet(parent: UIView, layout: UILayoutGuide){
        parent.addSubview(filterMeet)
        filterMeet.snp.makeConstraints { btn in
            btn.top.equalTo(layout).offset(15)
            btn.trailing.equalTo(-184)
            btn.width.equalTo(52)
            btn.height.equalTo(41)
        }
        filterMeet.setTitle("만남", for: .normal)
        filterMeet.setTitleColor(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1), for: .normal)
        filterMeet.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        filterMeet.layer.opacity = 0
    }
    private func initFilterCommunity(parent: UIView, layout: UILayoutGuide){
        parent.addSubview(filterCommunity)
        filterCommunity.snp.makeConstraints { btn in
            btn.top.equalTo(layout).offset(15)
            btn.trailing.equalTo(-124)
            btn.width.equalTo(52)
            btn.height.equalTo(41)
        }
        filterCommunity.setTitle("커뮤니티", for: .normal)
        filterCommunity.setTitleColor(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1), for: .normal)
        filterCommunity.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        filterCommunity.layer.opacity = 0
    }
    private func initFilterStory(parent: UIView, layout: UILayoutGuide){
        parent.addSubview(filterStory)
        filterStory.snp.makeConstraints { btn in
            btn.top.equalTo(layout).offset(15)
            btn.trailing.equalTo(-64)
            btn.width.equalTo(52)
            btn.height.equalTo(41)
        }
        filterStory.setTitle("이야기", for: .normal)
        filterStory.setTitleColor(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1), for: .normal)
        filterStory.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        filterStory.layer.opacity = 0
    }
    // MARK:- 최하단 버튼 3종
    private func initMenuButton(parent: UIView){
        parent.addSubview(menuButton.button)
        menuButton.button.snp.makeConstraints { bt in
            bt.bottom.equalTo(-48)
            bt.leading.equalTo(16)
            bt.width.equalTo(50)
            bt.height.equalTo(50)
        }
    }
    
    private func initChatButton(parent: UIView){
        parent.addSubview(chatButton.button)
        chatButton.button.snp.makeConstraints { bt in
            bt.bottom.equalTo(-48)
            bt.centerX.equalTo(parent)
            bt.width.equalTo(50)
            bt.height.equalTo(50)
        }
    }
    
    private func initCommunityButton(parent: UIView){
        parent.addSubview(communityButton.button)
        communityButton.button.snp.makeConstraints { bt in
            bt.bottom.equalTo(-48)
            bt.trailing.equalTo(-16)
            bt.width.equalTo(50)
            bt.height.equalTo(50)
        }
    }
    
    private func initMyLocationButton(parent: UIView){
        parent.addSubview(myLocationButton.button)
        myLocationButton.button.snp.makeConstraints { bt in
            bt.width.equalTo(40)
            bt.height.equalTo(40)
            bt.trailing.equalTo(-16)
            bt.bottom.equalTo(-118)
        }
    }
    // MARK:- 핀 추가 버튼
    private func initAddButton(parent: UIView, layout: UILayoutGuide){
        parent.addSubview(addButton.button)
        addButton.button.snp.makeConstraints { bt in
            bt.top.equalTo(layout).offset(76)
            bt.trailing.equalTo(-16)
            bt.width.equalTo(40)
            bt.height.equalTo(40)
        }
    }
    // MARK:- 중상부 버튼
    private func initsearchButton(parent: UIView, layout: UILayoutGuide){
        searchButton.button.imageView?.tag = 1
        parent.addSubview(searchButton.button)
        searchButton.button.snp.makeConstraints { bt in
            bt.top.equalTo(layout).offset(16)
            bt.leading.equalTo(16)
            bt.width.equalTo(40)
            bt.height.equalTo(40)
        }
    }
    
    private func initMoveButton(parent: UIView, layout: UILayoutGuide){
        parent.addSubview(moveButton.button)
        moveButton.button.snp.makeConstraints { bt in
            bt.top.equalTo(layout).offset(16)
            bt.trailing.equalTo(-16)
            bt.width.equalTo(40)
            bt.height.equalTo(40)
        }
    }
    
    private func initStarButton(parent: UIView, layout: UILayoutGuide){
        parent.addSubview(starButton.button)
        starButton.button.snp.makeConstraints { bt in
            bt.top.equalTo(layout).offset(136)
            bt.trailing.equalTo(-16)
            bt.width.height.equalTo(40)
        }
    }
    // MARK:- 그라데이션
    private func initGradationUp(parent: UIView){
        parent.addSubview(gradationUp)
        gradationUp.snp.makeConstraints { gra in
            gra.top.equalTo(0)
            gra.leading.equalTo(0)
            gra.width.equalTo(UIScreen.main.bounds.width)
            gra.height.equalTo(60)
        }
    }
    private func initGradationDown(parent: UIView){
        parent.addSubview(gradationDown)
        gradationDown.snp.makeConstraints { gra in
            gra.bottom.equalTo(0)
            gra.leading.equalTo(0)
            gra.width.equalTo(UIScreen.main.bounds.width)
            gra.height.equalTo(60)
        }
        gradationDown.layer.opacity = 0.75
    }
}

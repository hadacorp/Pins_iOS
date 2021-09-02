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
    // 핀 추가 버튼
    public var addButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 0.02745098039, green: 0.1294117647, blue: 0.337254902, alpha: 1), image: #imageLiteral(resourceName: "iconPlus"))
    // 내 위치로 이동 버튼
    public var myLocationButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), image: #imageLiteral(resourceName: "iconLocation"))
    // 그라데이션 위, 아래
    public var gradationUp = UIImageView(image: #imageLiteral(resourceName: "gradationUp"))
    public var gradationDown = UIImageView(image: #imageLiteral(resourceName: "gradationDown"))
    
    // SearchView Background
    public var searchBackground = UIView(frame: UIScreen.main.bounds)
    
    public var cardView: [BigRoundedbutton] = []
    // MARK:- Init UIView
    init(parent: UIView?, layout: UILayoutGuide?) {
        if let parent = parent{
            if let layout = layout {                
                initGradationUp(parent: parent)
                initGradationDown(parent: parent)
                
                initsearchButton(parent: parent, layout: layout)
                initAddButton(parent: parent, layout: layout)
                initMoveButton(parent: parent, layout: layout)
                
                initCommunityButton(parent: parent)
                initChatButton(parent: parent)
                initMenuButton(parent: parent)
                initSearchBackground(parent: parent)
                initMyLocationButton(parent: parent)
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
    
    // MARK:- 최하단 버튼 3종
    private func initMenuButton(parent: UIView){
        parent.addSubview(menuButton.button)
        menuButton.button.snp.makeConstraints { bt in
            bt.bottom.equalTo(-38)
            bt.leading.equalTo(16)
            bt.width.equalTo(50)
            bt.height.equalTo(50)
        }
    }
    
    private func initChatButton(parent: UIView){
        parent.addSubview(chatButton.button)
        chatButton.button.snp.makeConstraints { bt in
            bt.bottom.equalTo(-38)
            bt.centerX.equalTo(parent)
            bt.width.equalTo(50)
            bt.height.equalTo(50)
        }
    }
    
    private func initCommunityButton(parent: UIView){
        parent.addSubview(communityButton.button)
        communityButton.button.snp.makeConstraints { bt in
            bt.bottom.equalTo(-38)
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
            bt.bottom.equalTo(-108)
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
    }
}

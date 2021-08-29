//
//  UIManager.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/28.
//

import UIKit

class UIManager {
    // MARK:- Private variable
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
    public var cardView: [BigRoundedbutton] = []
    // MARK:- Init UIView
    init(parent: UIView?) {
        if let parent = parent{
            initsearchButton(parent: parent)
            initAddButton(parent: parent)
            initMoveButton(parent: parent)
            initMenuButton(parent: parent)
            initChatButton(parent: parent)
            initCommunityButton(parent: parent)
        }
    }
    
    // MARK:- Private function
    // UI 생성 및 세팅
    // MARK:- 최하단 버튼 3종
    private func initMenuButton(parent: UIView){
        parent.addSubview(menuButton.button)
        menuButton.button.snp.makeConstraints { bt in
            bt.bottom.equalTo(-38)
            bt.centerX.equalTo(parent)
            bt.width.equalTo(50)
            bt.height.equalTo(50)
        }
        menuButton.button.layer.shadowOpacity = 0.16
        menuButton.button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        menuButton.button.layer.shadowOffset = CGSize(width: 0, height: 4)
        menuButton.button.layer.shadowRadius = 8

        menuButton.button.layer.masksToBounds = false
    }
    
    private func initChatButton(parent: UIView){
        parent.addSubview(chatButton.button)
        chatButton.button.snp.makeConstraints { bt in
            bt.bottom.equalTo(-38)
            bt.leading.equalTo(16)
            bt.width.equalTo(50)
            bt.height.equalTo(50)
        }
        chatButton.button.layer.shadowOpacity = 0.16
        chatButton.button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        chatButton.button.layer.shadowOffset = CGSize(width: 0, height: 4)
        chatButton.button.layer.shadowRadius = 8

        chatButton.button.layer.masksToBounds = false
    }
    
    private func initCommunityButton(parent: UIView){
        parent.addSubview(communityButton.button)
        communityButton.button.snp.makeConstraints { bt in
            bt.bottom.equalTo(-38)
            bt.trailing.equalTo(-16)
            bt.width.equalTo(50)
            bt.height.equalTo(50)
        }
        
        communityButton.button.layer.shadowOpacity = 0.16
        communityButton.button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        communityButton.button.layer.shadowOffset = CGSize(width: 0, height: 4)
        communityButton.button.layer.shadowRadius = 8

        communityButton.button.layer.masksToBounds = false
    }
    // MARK:- 핀 추가 버튼
    private func initAddButton(parent: UIView){
        parent.addSubview(addButton.button)
        addButton.button.snp.makeConstraints { bt in
            bt.top.equalTo(120)
            bt.trailing.equalTo(-16)
            bt.width.equalTo(40)
            bt.height.equalTo(40)
        }
        addButton.button.layer.shadowOpacity = 0.16
        addButton.button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addButton.button.layer.shadowOffset = CGSize(width: 0, height: 4)
        addButton.button.layer.shadowRadius = 8

        addButton.button.layer.masksToBounds = false
        mainUI.append(addButton)
        
        addButton.button.layer.opacity = 0.9
    }
    // MARK:- 중상부 버튼
    private func initsearchButton(parent: UIView){
        parent.addSubview(searchButton.button)
        searchButton.button.snp.makeConstraints { bt in
            bt.top.equalTo(60)
            bt.leading.equalTo(16)
            bt.width.equalTo(40)
            bt.height.equalTo(40)
        }
        searchButton.button.layer.shadowOpacity = 0.16
        searchButton.button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        searchButton.button.layer.shadowOffset = CGSize(width: 0, height: 4)
        searchButton.button.layer.shadowRadius = 8

        searchButton.button.layer.masksToBounds = false
        
        searchButton.button.layer.opacity = 0.9
    }
    
    private func initMoveButton(parent: UIView){
        parent.addSubview(moveButton.button)
        moveButton.button.snp.makeConstraints { bt in
            bt.top.equalTo(60)
            bt.trailing.equalTo(-16)
            bt.width.equalTo(40)
            bt.height.equalTo(40)
        }
        moveButton.button.layer.shadowOpacity = 0.16
        moveButton.button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        moveButton.button.layer.shadowOffset = CGSize(width: 0, height: 4)
        moveButton.button.layer.shadowRadius = 8

        moveButton.button.layer.masksToBounds = false
        mainUI.append(moveButton)
        
        moveButton.button.layer.opacity = 0.9
    }
}

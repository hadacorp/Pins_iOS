//
//  MainViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/14.
//

import UIKit

class MainViewModel {
    // MARK:- Private variable
    private var mainUI: [Any] = []
    private var addButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 0.02745098039, green: 0.1294117647, blue: 0.337254902, alpha: 1))
    private var moveButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    private var searchButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    private var chatButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    private var menuButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    private var communityButton = SmallRoundedBtn(radius: 16, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    private var cardView: [BigRoundedbutton] = []
    
    // MARK:- Private function
    // UI 생성 및 세팅
    private func initCommunityButton(parent: UIView){
        parent.addSubview(communityButton.button)
        communityButton.button.snp.makeConstraints { bt in
            bt.bottom.equalTo(-38)
            bt.leading.equalTo(57)
            bt.width.equalTo(50)
            bt.height.equalTo(50)
        }
    }
    
    private func initMenuButton(parent: UIView){
        parent.addSubview(menuButton.button)
        menuButton.button.snp.makeConstraints { bt in
            bt.bottom.equalTo(-38)
            bt.centerX.equalTo(parent)
            bt.width.equalTo(50)
            bt.height.equalTo(50)
        }
    }
    
    private func initChatButton(parent: UIView){
        parent.addSubview(chatButton.button)
        chatButton.button.snp.makeConstraints { bt in
            bt.bottom.equalTo(-38)
            bt.trailing.equalTo(-57)
            bt.width.equalTo(50)
            bt.height.equalTo(50)
        }
    }
    
    private func initAddButton(parent: UIView){
        parent.addSubview(addButton.button)
        addButton.button.snp.makeConstraints { bt in
            bt.top.equalTo(120)
            bt.trailing.equalTo(-16)
            bt.width.equalTo(40)
            bt.height.equalTo(40)
        }
        
        mainUI.append(addButton)
    }
    
    private func initsearchButton(parent: UIView){
        parent.addSubview(searchButton.button)
        searchButton.button.snp.makeConstraints { bt in
            bt.top.equalTo(60)
            bt.leading.equalTo(16)
            bt.width.equalTo(40)
            bt.height.equalTo(40)
        }
    }
    
    private func initMoveButton(parent: UIView){
        parent.addSubview(moveButton.button)
        moveButton.button.snp.makeConstraints { bt in
            bt.top.equalTo(60)
            bt.trailing.equalTo(-16)
            bt.width.equalTo(40)
            bt.height.equalTo(40)
        }
        
        mainUI.append(moveButton)
    }
    
    // MARK:- Public function
    public func getMainUI() -> [Any]{
        return mainUI
    }
    
    public func getAddButton() -> UIButton{
        return addButton.button
    }
    
    public func getMoveButton() -> UIButton{
        return moveButton.button
    }
    
    public func AddCardView(radius: CGFloat, color: UIColor, parent: UIView){
        let temp = BigRoundedbutton(radius: radius, color: color)
        cardView.append(temp)
        
        parent.addSubview(temp.button)
    }
    
    public func getCardViewCount() -> Int{
        return cardView.count
    }
    
    public func getCardView() -> [BigRoundedbutton]{
        return cardView
    }
    
    // MARK:- Init function
    init(parent: UIView) {
        initsearchButton(parent: parent)
        initAddButton(parent: parent)
        initMoveButton(parent: parent)
        initCommunityButton(parent: parent)
        initMenuButton(parent: parent)
        initChatButton(parent: parent)
    }
    init() {
        print("첫 생성")
    }
}

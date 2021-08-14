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
    private var addButton = SmallRoundedBtn(radius: 15, color: #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1))
    private var moveButton = SmallRoundedBtn(radius: 15, color: #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1))
    private var cardView: [BigRoundedbutton] = []
    
    // MARK:- Private function
    // UI 생성 및 세팅
    private func initAddButton(parent: UIView){
        parent.addSubview(addButton.button)
        addButton.button.snp.makeConstraints { bt in
            bt.top.equalTo(150)
            bt.trailing.equalTo(-20)
            bt.width.equalTo(45)
            bt.height.equalTo(45)
        }
        
        mainUI.append(addButton)
    }
    
    private func initMoveButton(parent: UIView){
        parent.addSubview(moveButton.button)
        moveButton.button.snp.makeConstraints { bt in
            bt.top.equalTo(70)
            bt.trailing.equalTo(-20)
            bt.width.equalTo(45)
            bt.height.equalTo(45)
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
        initAddButton(parent: parent)
        initMoveButton(parent: parent)
    }
    init() {
        print("첫 생성")
    }
}

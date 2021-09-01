//
//  MainViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/14.
//

import UIKit

class MainViewModel: MainVCUI {
    // MARK:- Public function
    public func getMainUI() -> [Any]{
        return mainUI
    }
    
    public func getSearchButton() -> UIButton{
        return searchButton.button
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
    
    public func getSearchBackground() -> UIView {
        return searchBackground
    }
    
    public func setSearchBackgroundDown() {
        getSearchButton().layer.borderWidth = 1
        getSearchButton().layer.borderColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
        
        getSearchButton().layer.opacity = 1
        getSearchButton().layer.shadowOpacity = 0
        getSearchButton().layer.shadowOffset = CGSize(width: 0, height: 0)
        getSearchButton().layer.shadowRadius = 0

        getSearchButton().layer.masksToBounds = false
    }
    
    public func setSearchBackgroundUp(){
        getSearchButton().layer.borderWidth = 0
        getSearchButton().layer.shadowOpacity = 0.16
        getSearchButton().layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        getSearchButton().layer.shadowOffset = CGSize(width: 0, height: 4)
        getSearchButton().layer.shadowRadius = 8

        getSearchButton().layer.masksToBounds = false
        
        getSearchButton().layer.opacity = 0.9
    }
}

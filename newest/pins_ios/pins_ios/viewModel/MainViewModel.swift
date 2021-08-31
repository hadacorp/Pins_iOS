//
//  MainViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/14.
//

import UIKit

class MainViewModel: UIManager {
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
}

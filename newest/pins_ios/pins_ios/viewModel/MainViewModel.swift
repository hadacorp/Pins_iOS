//
//  MainViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/14.
//

import UIKit

class MainViewModel: MainVCUI {
    // MARK:- Public Variable
    public var checkablePins: [Pin]?
    
    // MARK:- Public function
    public func getPinCardsCount() -> Int{
        if let checkablePins = checkablePins {
            return checkablePins.count
        }
        return 0
    }
    
    public func resetPins() {
        checkablePins?.removeAll()
    }
    
    public func getCheckablePins() -> [Pin]?{
        return checkablePins
    }
    
    public func setCheckablePins(checkablePins: [Pin]?) {
        self.checkablePins = checkablePins
    }
    
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
    
    public func getSearchBackground() -> UIView {
        return searchBackground
    }
    
    public func getMyLocationButton() -> UIButton {
        return myLocationButton.button
    }
    
    // 필터 3종 get
    public func getFilterMeetButton() -> UIButton{
        return filterMeet
    }
    public func getFilterCommunityButton() -> UIButton{
        return filterCommunity
    }
    public func getFilterStoryButton() -> UIButton{
        return filterStory
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
    
    public func makePins(parent: UIView, type: String, category: String){
        var background: UIImage?
        var image: UIImage?
        if type == PinType.meet.rawValue{
            background = #imageLiteral(resourceName: "pinBackground")
            switch category{
            case "대화/친목":
                image = #imageLiteral(resourceName: "pinTalk")
            case "산책/반려동물":
                image = #imageLiteral(resourceName: "pinWalk")
            case "맛집탐방":
                image = #imageLiteral(resourceName: "pinFood")
            case "영화/문화생활":
                image = #imageLiteral(resourceName: "pinMovie")
            case "게임/오락":
                image = #imageLiteral(resourceName: "pinGame")
            case "스포츠/운동":
                image = #imageLiteral(resourceName: "pinExercise")
            case "등산/캠핑":
                image = #imageLiteral(resourceName: "pinHiking")
            case "스터디/독서":
                image = #imageLiteral(resourceName: "pinStudy")
            case "여행/드라이브":
                image = #imageLiteral(resourceName: "pinTrip")
            case "거래/나눔":
                image = #imageLiteral(resourceName: "pinTrade")
            case "기타":
                image = #imageLiteral(resourceName: "pinOthers")
            default:
                image = #imageLiteral(resourceName: "iconMyMenu")
            }
        }
        if let background = background {
            let pinBackground = UIImageView.init(image: background)
            parent.addSubview(pinBackground)
            pinBackground.snp.makeConstraints { bg in
                bg.width.equalTo(37)
                bg.height.equalTo(49)
                bg.center.equalTo(parent)
            }
        }
        
        if let image = image {
            let pinImage = UIImageView.init(image: image)
            parent.addSubview(pinImage)
            pinImage.snp.makeConstraints { bg in
                bg.width.equalTo(34)
                bg.height.equalTo(46)
                bg.center.equalTo(parent)
            }
        }
    }
}

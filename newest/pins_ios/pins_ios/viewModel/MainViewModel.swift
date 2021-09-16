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
        return -1
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
    
    public func meetingPin(parent: UIView, type: String, category: String){
        var background: UIImage?
        
        // 그림자 생성
        let shadow = UIImageView()
        parent.addSubview(shadow)
        shadow.snp.makeConstraints { sd in
            sd.bottom.equalTo(27)
            sd.width.equalTo(20)
            sd.height.equalTo(8)
            sd.centerX.equalTo(parent)
        }
        shadow.image = UIImage(named: "shadowMeeting")
        
        var image: UIImage?
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
    
    public func communityPin(parent: UIView, type: String, title: String){
        let shadow = UIImageView()
        var background: UIImage?
        // 그림자 생성
        parent.addSubview(shadow)
        shadow.snp.makeConstraints { sd in
            sd.bottom.equalTo(16)
            sd.width.equalTo(26)
            sd.height.equalTo(10)
            sd.centerX.equalTo(parent)
        }
        shadow.image = UIImage(named: "shadowCommunity")

        // 배경 생성
        background = #imageLiteral(resourceName: "community")
        if let background = background {
            let pinBackground = UIImageView.init(image: background)
            parent.addSubview(pinBackground)
            pinBackground.snp.makeConstraints { bg in
                bg.width.equalTo(30)
                bg.height.equalTo(26)
                bg.center.equalTo(parent)
            }
        }
        
        // 타이틀 생성 30
        let label = UIButton()
        parent.addSubview(label)
        label.setTitle(title, for: .normal)
        label.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        label.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 2, right: 6)
        label.setTitleColor(.white, for: .normal)
        label.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.4588235294, blue: 0.6823529412, alpha: 1)
        label.snp.makeConstraints { lb in
            lb.height.equalTo(19)
            lb.bottom.equalTo(30)
        }
    }
    
    public func storyPin(parent: UIView, type: String, category: String) {
        let shadow = UIImageView()
        parent.addSubview(shadow)
        shadow.snp.makeConstraints { sd in
            sd.bottom.equalTo(parent).offset(19)
            sd.width.equalTo(20)
            sd.height.equalTo(8)
            sd.centerX.equalTo(parent)
        }
        shadow.image = UIImage(named: "shadowStory")
        
        let background = UIImageView()
        parent.addSubview(background)
        background.snp.makeConstraints { bg in
            bg.width.equalTo(62)
            bg.height.equalTo(31)
            bg.center.equalTo(parent)
        }
        background.image = #imageLiteral(resourceName: "story")
        
        let tag = UILabel()
        background.addSubview(tag)
        tag.snp.makeConstraints { tag in
            tag.width.equalTo(62)
            tag.height.equalTo(17)
            tag.bottom.equalTo(-11)
            tag.top.equalTo(3)
            tag.centerX.equalTo(background)
        }
        tag.text = category
        tag.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        tag.textColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        tag.textAlignment = .center
    }
    public func makePins(parent: UIView, type: String, category: String, title: String){
        if PinType.init(rawValue: type) == .meet{
            meetingPin(parent: parent, type: type, category: category)
        }
        else if PinType.init(rawValue: type) == .community{
            communityPin(parent: parent, type: type, title: title)
        }
        else{
            storyPin(parent: parent, type: type, category: category)
        }
    }
}

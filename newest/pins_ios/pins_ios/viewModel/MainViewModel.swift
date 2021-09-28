//
//  MainViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/14.
//
import MapKit
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
    
    public func getPinsIndex(index: Int) -> Pin{
        return checkablePins![index]
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
    
    public func makePin(pinAnnotation: [CustomPintAnnotation], annotationView: MKAnnotationView, annotation: MKAnnotation){
        let pinTemp = pinAnnotation[Int(annotation.subtitle!!)!]
        if pinTemp.pinType == PinType.meet.rawValue {
            switch pinTemp.pinCategory {
            case "대화/친목":
                annotationView.image = UIImage(named: "pinBaseTalk")
            case "산책/반려동물":
                annotationView.image = UIImage(named: "pinBaseWalk")
            case "맛집탐방":
                annotationView.image = UIImage(named: "pinBaseMeal")
            case "영화/문화생활":
                annotationView.image = UIImage(named: "pinBaseMovie")
            case "게임/오락":
                annotationView.image = UIImage(named: "pinBaseGame")
            case "스포츠/운동":
                annotationView.image = UIImage(named: "pinBaseSport")
            case "등산/캠핑":
                annotationView.image = UIImage(named: "pinBaseHiking")
            case "스터디/독서":
                annotationView.image = UIImage(named: "pinBaseStudy")
            case "여행/드라이브":
                annotationView.image = UIImage(named: "pinBaseTrip")
            case "거래/나눔":
                annotationView.image = UIImage(named: "pinBaseTrade")
            default:
                annotationView.image = UIImage(named: "pinBaseOthers")
            }
        }
        else{
            annotationView.image = #imageLiteral(resourceName: "story")
            
            let label = UILabel()
            annotationView.addSubview(label)
            label.snp.makeConstraints { text in
                text.width.equalTo(62)
                text.height.equalTo(17)
                text.top.equalTo(3)
                text.centerX.equalTo(annotationView)
            }
            label.text = pinTemp.pinCategory
            label.textColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
            label.textAlignment = .center
            label.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        }
    }
    
    public func focusPin(pinAnnotation: [CustomPintAnnotation], annotationView: MKAnnotationView, annotation: MKAnnotation){
        let pinTemp = pinAnnotation[Int(annotation.subtitle!!)!]
        if pinTemp.pinType == PinType.meet.rawValue {
            switch pinTemp.pinCategory {
            case "대화/친목":
                annotationView.image = UIImage(named: "pinSelectedTalk")
            case "산책/반려동물":
                annotationView.image = UIImage(named: "pinSelectedWalk")
            case "맛집탐방":
                annotationView.image = UIImage(named: "pinSelectedMeal")
            case "영화/문화생활":
                annotationView.image = UIImage(named: "pinSelectedMovie")
            case "게임/오락":
                annotationView.image = UIImage(named: "pinSelectedGame")
            case "스포츠/운동":
                annotationView.image = UIImage(named: "pinSelectedSport")
            case "등산/캠핑":
                annotationView.image = UIImage(named: "pinSelectedHiking")
            case "스터디/독서":
                annotationView.image = UIImage(named: "pinSelectedStudy")
            case "여행/드라이브":
                annotationView.image = UIImage(named: "pinSelectedTrip")
            case "거래/나눔":
                annotationView.image = UIImage(named: "pinSelectedTrade")
            default:
                annotationView.image = UIImage(named: "pinSelectedOthers")
            }
        }
        else{
            annotationView.image = #imageLiteral(resourceName: "seletedStory")
            // subview 삭제
            for view in annotationView.subviews {
                view.removeFromSuperview()
            }
            
            let label = UILabel(frame: CGRect(x: 0, y: 3, width: 62, height: 17))
            annotationView.addSubview(label)
            label.snp.makeConstraints { text in
                text.width.equalTo(62)
                text.height.equalTo(17)
                text.top.equalTo(3)
                text.centerX.equalTo(annotationView)
            }
            label.text = pinTemp.pinCategory
            label.textColor = #colorLiteral(red: 0.7137254902, green: 0.2156862745, blue: 1, alpha: 1)
            label.textAlignment = .center
            label.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        }
    }
    
    public func unfocusPin(pinAnnotation: [CustomPintAnnotation], annotationView: MKAnnotationView, annotation: MKAnnotation){
        let pinTemp = pinAnnotation[Int(annotation.subtitle!!)!]
        if pinTemp.pinType == PinType.meet.rawValue {
            switch pinTemp.pinCategory {
            case "대화/친목":
                annotationView.image = UIImage(named: "pinBaseTalk")
            case "산책/반려동물":
                annotationView.image = UIImage(named: "pinBaseWalk")
            case "맛집탐방":
                annotationView.image = UIImage(named: "pinBaseMeal")
            case "영화/문화생활":
                annotationView.image = UIImage(named: "pinBaseMovie")
            case "게임/오락":
                annotationView.image = UIImage(named: "pinBaseGame")
            case "스포츠/운동":
                annotationView.image = UIImage(named: "pinBaseSport")
            case "등산/캠핑":
                annotationView.image = UIImage(named: "pinBaseHiking")
            case "스터디/독서":
                annotationView.image = UIImage(named: "pinBaseStudy")
            case "여행/드라이브":
                annotationView.image = UIImage(named: "pinBaseTrip")
            case "거래/나눔":
                annotationView.image = UIImage(named: "pinBaseTrade")
            default:
                annotationView.image = UIImage(named: "pinBaseOthers")
            }
        }
        else{
            annotationView.image = #imageLiteral(resourceName: "story")
            // subview 삭제
            for view in annotationView.subviews {
                view.removeFromSuperview()
            }
            
            let label = UILabel(frame: CGRect(x: 0, y: 3, width: 62, height: 17))
            annotationView.addSubview(label)
            label.snp.makeConstraints { text in
                text.width.equalTo(62)
                text.height.equalTo(17)
                text.top.equalTo(3)
                text.centerX.equalTo(annotationView)
            }
            label.text = pinTemp.pinCategory
            label.textColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
            label.textAlignment = .center
            label.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        }
    }
}

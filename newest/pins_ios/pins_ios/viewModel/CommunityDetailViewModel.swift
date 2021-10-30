//
//  CommunityDetailViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/14.
//

import UIKit

class CommunityDetailViewModel: CommunityDetailVCUI {
    private var filters: [String] = ["학교/동창", "아파트/이웃", "대화/친목", "산책/반려동물", "맛집탐방", "영화/문화생활", "게임/오락", "스포츠/운동", "등산/캠핑", "스터디/독서", "여행/드라이브", "기타"]
    private var joinsType: [String] = ["자유 참가 방식", "참가 신청 방식"]
    private var profile: [String] = ["개인 프로필로 참가", "익명 프로필로 참가"]
    private var genders: [String] = ["성별 무관", "남자만", "여자만"]
    private var filterClicked: Int = -1
    private var joinTypeClicked: Int = 0
    private var clickedGender: Int = 0
    private var profileClicked: Int = 0
    
    private var minAge = 20
    private var maxAge = 50
    
    public func setMinAge(age: Int){
        minAge = age
    }
    public func setMaxAge(age: Int){
        maxAge = age
    }
    public func setAgeDescription(string: String){
        ageDescription.text = string
    }
    
    public func getProfileType() -> [String]{
        return profile
    }
    public func getProfileClicked() -> Int{
        return profileClicked
    }
    public func setProfileClicked(type: Int){
        profileClicked = type
    }
    public func getGenders() -> [String]{
        return genders
    }
    public func setClickedGender(count: Int){
        clickedGender = count
    }
    public func getClickedGender() -> Int{
        return clickedGender
    }
    public func getJoinsType() -> [String]{
        return joinsType
    }
    public func getJoinTypeClicked() -> Int{
        return joinTypeClicked
    }
    public func setJoinTypeClicked(type: Int){
        joinTypeClicked = type
    }
    public func getFilters() -> [String]{
        return filters
    }
    public func getFiltersCount() -> Int{
        return filters.count
    }
    public func getFilterClicked() -> Int{
        return filterClicked
    }
    public func setFilterClicked(count: Int){
        filterClicked = count
    }
    public func getNextBtn() -> UIButton{
        return nextButton
    }
    public func checkNext() -> Bool{
        if filterClicked != -1{
            return true
        }
        return false
    }
    public func activateNextButton(){
        if checkNext(){
            nextButton.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        }
    }
    
    public func saveSetting(){
        CommunityPin.shared.category = filters[filterClicked]
        if clickedGender == 0{
            CommunityPin.shared.setGender = "Both"
        }
        else if clickedGender == 1{
            CommunityPin.shared.setGender = "Male"
        }
        else if clickedGender == 2{
            CommunityPin.shared.setGender = "Female"
        }
        CommunityPin.shared.minAge = minAge
        CommunityPin.shared.maxAge = maxAge
    }
}

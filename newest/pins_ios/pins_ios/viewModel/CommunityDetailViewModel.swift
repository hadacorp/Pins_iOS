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
    private var filterClicked: Int = -1
    private var joinTypeClicked: Int = 0
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
}

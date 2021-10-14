//
//  CommunityDetailViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/14.
//

import UIKit

class CommunityDetailViewModel: CommunityDetailVCUI {
    private var filters: [String] = ["학교/동창", "아파트/이웃", "대화/친목", "산책/반려동물", "맛집탐방", "영화/문화생활", "게임/오락", "스포츠/운동", "등산/캠핑", "스터디/독서", "여행/드라이브", "기타"]
    private var filterClicked: Int = -1
    
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

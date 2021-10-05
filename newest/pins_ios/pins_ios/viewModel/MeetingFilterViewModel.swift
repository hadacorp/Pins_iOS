//
//  MettingFilterViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/06.
//

import UIKit

class MeetingFilterViewModel {
    private var filters: [String] = ["전체 선택", "대화/친목", "산책/반려동물", "맛집탐방", "영화/문화생활", "게임/오락", "스포츠/운동", "등산/캠핑", "스터디/독서", "여행/드라이브", "거래/나눔", "기타"]
    
    public func getFilters() -> [String]{
        return filters
    }
    
    public func getFiltersCount() -> Int{
        return filters.count
    }
}

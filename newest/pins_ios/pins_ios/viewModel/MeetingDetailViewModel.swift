//
//  MeetingDetailViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/08.
//

import UIKit

class MeetingDetailViewModel {
    private var filters: [String] = ["대화/친목", "산책/반려동물", "맛집탐방", "영화/문화생활", "게임/오락", "스포츠/운동", "등산/캠핑", "스터디/독서", "여행/드라이브", "거래/나눔", "기타"]
    private var clicked: Int = -1
    private var clickedDate: Int = -1
    
    private var weeks: [String] = ["토", "일", "월", "화", "수", "목", "금"]
    
    public func getFilters() -> [String]{
        return filters
    }
    public func getFiltersCount() -> Int{
        return filters.count
    }
    public func getClicked() -> Int{
        return clicked
    }
    public func setClicked(count: Int){
        clicked = count
    }
    public func getClickedDate() -> Int{
        return clickedDate
    }
    public func setClickedDate(count: Int){
        clickedDate = count
    }
    
    public func getDates() -> [String]{
        var result: [String] = []
        let today = Date()
        for i in 0 ..< 8{
            let next = Calendar.current.date(byAdding: .day, value: i, to: today)
            let day = Calendar.current.component(.day, from: next!)
            let weekday = Calendar.current.component(.weekday, from: next!)
            result.append("\(day) " + "\(weeks[(weekday % 7)])")
        }
        return result
    }
}

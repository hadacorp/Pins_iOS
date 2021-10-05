//
//  MettingFilterViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/06.
//

import UIKit

class MeetingFilterViewModel {
    private var filters: [String] = ["전체 선택", "대화/친목", "산책/반려동물", "맛집탐방", "영화/문화생활", "게임/오락", "스포츠/운동", "등산/캠핑", "스터디/독서", "여행/드라이브", "거래/나눔", "기타"]
    private var click: [Int] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    public func getFilters() -> [String]{
        return filters
    }
    
    public func getFiltersCount() -> Int{
        return filters.count
    }
    
    public func getClickList() -> [Int]{
        return click
    }
    
    public func clickFilter(index: Int){
        // 전체 선택이 클릭 됐을 때
        if index == 0{
            click = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }
        else{
            click[0] = 0
            // 해제
            if click[index] == 1{
                // 클릭 돼 있는게 한개보다 많을 때만
                if click.filter({ $0 == 1 }).count > 1{
                    click[index] = 0
                }
            }
            // 체크
            else{
                if click.filter({ $0 == 1 }).count == 10{
                    click = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                }
                else{
                    click[index] = 1
                }
            }
        }
    }
}

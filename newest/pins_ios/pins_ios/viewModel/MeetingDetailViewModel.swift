//
//  MeetingDetailViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/08.
//

import UIKit

class MeetingDetailViewModel: MeetingDetailVCUI {
    private var filters: [String] = ["대화/친목", "산책/반려동물", "맛집탐방", "영화/문화생활", "게임/오락", "스포츠/운동", "등산/캠핑", "스터디/독서", "여행/드라이브", "거래/나눔", "기타"]
    private var clicked: Int = -1
    private var clickedDate: Int = -1
    private var clickedGender: Int = 0
    
    private var weeks: [String] = ["토", "일", "월", "화", "수", "목", "금"]
    private var genders: [String] = ["성별 무관", "남자만", "여자만"]
    
    private var meetTime: Int = 1020
    
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
    public func getGenders() -> [String]{
        return genders
    }
    public func setClickedGender(count: Int){
        clickedGender = count
    }
    public func getClickedGender() -> Int{
        return clickedGender
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
    
    public func plusHour(){
        meetTime += 60
        if meetTime > 1440{
            meetTime -= 1440
        }
    }
    public func minusHour(){
        meetTime -= 60
        if meetTime < 0{
            meetTime += 1440
        }
    }
    
    public func plusMinute(){
        meetTime += 10
        if meetTime > 1440{
            meetTime -= 1440
        }
    }
    public func minusMinute(){
        meetTime -= 10
        if meetTime < 0{
            meetTime += 1440
        }
    }
    
    public func convertTime() -> String{
        var ampm = ""
        if meetTime >= 0 && meetTime <= 720{
            ampm = "오전 "
        }
        else{
            ampm = "오후 "
        }
        
        var hour = meetTime / 60
        if hour > 12 {
            hour = hour - 12
        }
        
        let minute = meetTime % 60
        var minuteString = String(minute)
        if minute < 10{
            minuteString = "0\(minute)"
        }
        return ampm + "\(hour)시" + minuteString + "분"
    }
    
    public func getHour() -> String{
        let hour = convertTime()
        let index = hour.firstIndex(of: "시")!
        return String(hour[hour.startIndex ..< hour.index(after: index)])
    }
    public func getMinute() -> String{
        let minute = convertTime()
        let index = minute.firstIndex(of: "시")!
        return String(minute[minute.index(after: index) ..< minute.endIndex])
    }
}

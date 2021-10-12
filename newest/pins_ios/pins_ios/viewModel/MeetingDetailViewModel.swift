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
    private var joinCount = 1
    private var joinMax = 9
    
    private var minAge = 20
    private var maxAge = 50
    
    private var paramHour = 17
    private var paramMinute = 0
    
    private var weeks: [String] = ["토", "일", "월", "화", "수", "목", "금"]
    private var genders: [String] = ["성별 무관", "남자만", "여자만"]
    
    private var meetTime: Int = 1020
    
    public func setMinAge(age: Int){
        minAge = age
    }
    public func setMaxAge(age: Int){
        maxAge = age
    }
    
    public func getJoinCount() -> Int{
        return joinCount
    }
    public func setJoinCount(width: Int, cur: Int){
        var count = 0
        var unit = 0
        unit = width / joinMax
        count = cur / unit
        return joinCount = count + 1
    }
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
    public func setHourLabel(string: String){
        hourLabel.text = string
    }
    public func setMinuteLabel(string: String){
        minuteLabel.text = string
    }
    public func getHourPlusBtn() -> UIButton{
        return hourPlusButton
    }
    public func getHourMinusBtn() -> UIButton{
        return hourMinusButton
    }
    public func getMinutePlusBtn() -> UIButton{
        return minutePlusButton
    }
    public func getMinuteMinusBtn() -> UIButton{
        return minuteMinusButton
    }
    public func getNextBtn() -> UIButton{
        return nextButton
    }
    public func setDateDescription(string: String){
        dateDescription.text = string
    }
    public func setTimeDescription(string: String){
        timeDescription.text = string
    }
    public func setCountDescription(string: String){
        countDescription.text = string
    }
    
    public func setAgeDescription(string: String){
        ageDescription.text = string
    }
    
    public func getDay(index: Int) -> Int{
        let today = Date()
        let next = Calendar.current.date(byAdding: .day, value: index, to: today)
        let day = Calendar.current.component(.day, from: next!)
        
        return day
    }
    
    public func getDate(index: Int) -> String{
        let today = Date()
        let next = Calendar.current.date(byAdding: .day, value: index, to: today)
        let year = Calendar.current.component(.year, from: next!)
        let month = Calendar.current.component(.month, from: next!)
        let day = Calendar.current.component(.day, from: next!)
        let weekday = Calendar.current.component(.weekday, from: next!)
        
        return "\(year)년 \(month)월 \(day)일 \(weeks[(weekday % 7)])요일"
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
        if (meetTime >= 0 && meetTime < 720) || meetTime == 1440{
            ampm = "오전 "
        }
        else{
            ampm = "오후 "
        }
        
        var hour = meetTime / 60
        paramHour = hour
        
        if hour > 12 {
            hour = hour - 12
        }
        else if hour == 0{
            hour = 12
        }
        
        let minute = meetTime % 60
        paramMinute = minute
        
        var minuteString = String(minute)
        if minute < 10{
            minuteString = "0\(minute)"
        }
        
        
        
        return ampm + "\(hour)시" + minuteString + "분"
    }
    
    public func getTime() -> String{
        var ampm = ""
        if (meetTime >= 0 && meetTime < 720) || meetTime == 1440{
            ampm = "오전 "
        }
        else{
            ampm = "오후 "
        }
        
        var hour = meetTime / 60
        if hour > 12 {
            hour = hour - 12
        }
        else if hour == 0{
            hour = 12
        }
        
        let minute = meetTime % 60
        var minuteString = String(minute)
        if minute < 10{
            minuteString = "0\(minute)"
        }
        return ampm + "\(hour):" + minuteString
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

    public func checkNext() -> Bool{
        if clicked != -1 && clickedDate != -1{
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
        MeetingPin.shared.category = filters[clicked]
        MeetingPin.shared.date = clickedDate
        MeetingPin.shared.hour = paramHour
        MeetingPin.shared.minute = paramMinute
        if clickedGender == 0{
            MeetingPin.shared.setGender = "Both"
        }
        else if clickedGender == 1{
            MeetingPin.shared.setGender = "Male"
        }
        else if clickedGender == 2{
            MeetingPin.shared.setGender = "Female"
        }
        MeetingPin.shared.setLimit = joinCount
        MeetingPin.shared.minAge = minAge
        MeetingPin.shared.maxAge = maxAge
    }
}

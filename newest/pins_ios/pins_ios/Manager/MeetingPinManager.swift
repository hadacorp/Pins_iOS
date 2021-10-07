//
//  MeetingPinManager.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/08.
//

import UIKit

//var title: String?
//var content: String?
//var category: String?
//var setGender: String?
//var minAge: Int?
//var maxAge: Int?
//var setLimit: Int?
//var longitude: Double?
//var latitude: Double?
//var date: Int?
//var hour: Int?
//var minute: Int?

class MeetingPinManager {
    public func getTitle() -> String{
        if let title = MeetingPin.shared.title{
            return title
        }
        else{
            return ""
        }
    }
    public func setTitle(title: String){
        MeetingPin.shared.title = title
    }
    
    public func getContent() -> String{
        if let content = MeetingPin.shared.content{
            return content
        }
        else{
            return ""
        }
    }
    public func setContent(content: String){
        MeetingPin.shared.content = content
    }
    
    public func getCategory() -> String{
        if let category = MeetingPin.shared.category{
            return category
        }
        else{
            return ""
        }
    }
    public func setCategory(category: String){
        MeetingPin.shared.category = category
    }
    
    public func getMinAge() -> Int{
        if let minAge = MeetingPin.shared.minAge{
            return minAge
        }
        else{
            return -1
        }
    }
    public func setMinAge(minAge: Int){
        MeetingPin.shared.minAge = minAge
    }
    
    public func getLongitude() -> Double{
        if let longitude = MeetingPin.shared.longitude{
            return longitude
        }
        else{
            return -1
        }
    }
    public func setLongitude(longitude: Double){
        MeetingPin.shared.longitude = longitude
    }
    
    public func getLatitude() -> Double{
        if let latitude = MeetingPin.shared.latitude{
            return latitude
        }
        else{
            return -1
        }
    }
    public func setLatitude(latitude: Double){
        MeetingPin.shared.latitude = latitude
    }
    
    public func getDate() -> Int{
        if let date = MeetingPin.shared.date{
            return date
        }
        else{
            return -1
        }
    }
    public func setDate(date: Int){
        MeetingPin.shared.date = date
    }
    
    public func getHour() -> Int{
        if let hour = MeetingPin.shared.hour{
            return hour
        }
        else{
            return -1
        }
    }
    public func setHour(hour: Int){
        MeetingPin.shared.hour = hour
    }
    
    public func getMinute() -> Int{
        if let minute = MeetingPin.shared.minute{
            return minute
        }
        else{
            return -1
        }
    }
    public func setMinute(minute: Int){
        MeetingPin.shared.minute = minute
    }
}

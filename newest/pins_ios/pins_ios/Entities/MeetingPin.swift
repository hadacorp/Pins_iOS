//
//  MeetingPin.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/08.
//

import UIKit

class MeetingPin {
    static var shared = MeetingPin()
    
    var title: String?
    var content: String?
    var category: String?
    var setGender: String?
    var minAge: Int?
    var maxAge: Int?
    var setLimit: Int?
    var longitude: Double?
    var latitude: Double?
    var date: Int?
    var hour: Int?
    var minute: Int?
    
    private init() {}
}

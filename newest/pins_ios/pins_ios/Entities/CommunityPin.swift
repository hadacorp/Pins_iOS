//
//  CommunityPin.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/30.
//

import UIKit

class CommunityPin {
    static var shared = CommunityPin()
    
    var title: String?
    var content: String?
    var category: String?
    var setGender: String?
    var minAge: Int?
    var maxAge: Int?
    var setLimit: Int?
    var longitude: Double?
    var latitude: Double?
    var image: String?
    
    private init() {}
}

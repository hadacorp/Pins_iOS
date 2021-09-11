//
//  Pin.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/09.
//

import UIKit

class Pin: Decodable {
    var distance: Double?
    var pinType: String?
    var category: String?
    var pinDBId: Int?
    var latitude: Double?
    var longitude: Double?
    var date: String?
    var title: String?
    var image: String?
    var like: Int?
    var comment: Int?
}

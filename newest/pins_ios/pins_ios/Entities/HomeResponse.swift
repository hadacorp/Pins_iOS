//
//  HomeResponse.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/04.
//

import UIKit

struct HomeResponse: Decodable {
    let distance: Double?
    let pinType: String?
    let category: String?
    let pinDBId: Int?
    let latitude: Double?
    let longitude: Double?
    let date: String?
    let title: String?
    let image: String?
}

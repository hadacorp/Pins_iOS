//
//  CardDetail.swift
//  pins_ios
//
//  Created by judongseok on 2021/12/02.
//

import UIKit

struct CreateUser: Codable{
    let id: Int?
    let nickName: String?
    let detail: String?
    let image: String?
}

struct MeetingCardDetail: Codable {
    let id: Int?
    let createUser: CreateUser?
    let title: String?
    let content: String?
    let category: String?
    let setGender: String?
    let ageRange: String?
    let setLimit: Int?
    let participantNum: Int?
    let address: String?
    let date: String?
    let participantDetailList: [CreateUser]?
}

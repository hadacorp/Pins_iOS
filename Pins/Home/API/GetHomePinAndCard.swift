//
//  GetHomePinAndCard.swift
//  Pins
//
//  Created by judongseok on 2022/01/15.
//

import UIKit
import Alamofire

struct HomePinRequest: Codable {
    var latitude: Double
    var longitude: Double
    var keyword: String
    var meetDate: String
    var startMeetTime: String
    var endMeetTime: String
    var minAge: Int
    var maxAge: Int
    var meetGender: String
    var meetingPinCategory: String
    var communityPinCategory: String
    var storyPinCategory: String
}

struct HomeCards: Codable {
    var data: DataClass
}

struct DataClass: Codable {
    let storyPin: [StoryPin]
    let meetingPin: [MeetingPin]
    let communityPin: [CommunityPin]
}

struct StoryPin: Codable {
    var id: Int
    var createUser: CreateUser
    var latitude: Double
    var longitude: Double
    var createAt: String
    var category: String
    var content: String
    var images: [String]
}

struct MeetingPin: Codable {
    var id: Int
    var createUser: CreateUser
    var latitude: Double
    var longitude: Double
    var address: String
    var dateTime: String
    var content: String
    var images: [String]
    var setLimit: Int
    var participantNum: Int
    var category: String
}

struct CommunityPin: Codable {
    var id: Int
    var createUser: CreateUser
    var latitude: Double
    var longitude: Double
    var startedAt: String
    var content: String
    var images: [String]
    var participantNum: Int
    var category: String
}

struct CreateUser: Codable {
    var id: Int
    var nickName: String
    var gender: String
    var profileImage: String
}

struct NetworkService {
    func getHomePinAndCard(param: HomePinRequest) {
        let API_KEY = Bundle.main.apiKey
        let token = Bundle.main.token
        let url = API_KEY
        + "/v1/home/pin?"
        + "latitude=" + param.latitude.description
        + "&longitude=" + param.longitude.description
        + "&keyword=" + param.keyword
        + "&meetDate=" + param.meetDate.description
        + "&startMeetTime=" + param.startMeetTime.description
        + "&endMeetTime=" + param.endMeetTime.description
        + "&minAge=" + param.minAge.description
        + "&maxAge=" + param.maxAge.description
        + "&meetGender=" + param.meetGender.description
        + "&meetingPinCategory=" + param.meetingPinCategory.description
        + "&communityPinCategory=" + param.communityPinCategory.description
        + "&stroyPinCategory=" + param.storyPinCategory.description
        
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print(url)
                    let jsonData = try? JSONDecoder().decode(HomeCards.self, from: response.data!)
                    print(jsonData)
                case let .failure(error):
                    print(error)
                }
            }
    }
}

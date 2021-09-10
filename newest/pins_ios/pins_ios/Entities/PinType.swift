//
//  PinType.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/11.
//

import UIKit

enum PinType: String{
    case meet = "meetingPin"
    case community = "communityPin"
    case storyWithImage, storyWithoutImage = "storyPin"
    
    func discription() -> String {
        switch self {
        case .meet:
            return "만남"
        case .community:
            return "커뮤니티"
        case .storyWithImage:
            return "이야기"
        case .storyWithoutImage:
            return "이야기"
        }
    }
}

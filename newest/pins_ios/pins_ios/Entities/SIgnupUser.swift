//
//  SIgnupUser.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/24.
//

import Foundation
import UIKit

class SignupUser {
    static var shared = SignupUser()
    var name: String?
    var nickName: String?
    var phoneNum: String?
    var image: UIImage?
    var resredNumber: String?
    private init() {}
}

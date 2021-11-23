//
//  SIgnupUser.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/24.
//

import Foundation

class SignupUser {
    static var shared = SignupUser()
    
    var mobileType: String?
    private init() {}
}

//
//  MeetingContentViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/12.
//

import UIKit

class MeetingContentViewModel {
    private var titleCheck = false
    private var contentCheck = false
    
    public func getTitleCheck() -> Bool{
        return titleCheck
    }
    public func setTitleCheck(bool: Bool){
        titleCheck = bool
    }
    public func getContentCheck() -> Bool{
        return contentCheck
    }
    public func setContentCheck(bool: Bool){
        contentCheck = bool
    }
}

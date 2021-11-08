//
//  ViewControllers.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/09.
//

import UIKit

class ViewControllers {
    static var shared = ViewControllers()
    var picker: UIImagePickerController?
    var communityContentVC: CommunityContentVC?
    
    private init() {
    }
}

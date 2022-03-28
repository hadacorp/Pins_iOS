//
//  Pins+Bundle.swift
//  Pins
//
//  Created by judongseok on 2022/03/28.
//

import Foundation

extension Bundle {
    var apiKey: String {
        guard let file = self.path(forResource: "PinInfo", ofType: "plist") else { return "" }
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["API_KEY"] as? String else { fatalError("PinInfo.plist에 API_KEY 설정을 해주세요.") }
        
        return key
    }
}

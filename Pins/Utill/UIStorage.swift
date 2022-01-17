//
//  UIStorage.swift
//  Pins
//
//  Created by judongseok on 2022/01/17.
//

import Foundation

// Singleton
class UIStorage {
    static var shared = UIStorage()
    
    var storage: [String: AnyObject] = [:]
    
    func addUI(id: String, UI: AnyObject) {
        storage[id] = UI
    }
    
    func getUI(id: String) -> AnyObject? {
        return storage[id] ?? nil
    }
    
    func releaseUI(id: String) {
        storage.removeValue(forKey: id)
    }
}

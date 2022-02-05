//
//  SearchViewModel.swift
//  Pins
//
//  Created by judongseok on 2022/02/05.
//

import Foundation

class SearchViewModel {
    var viewDic: [Int: String] = [:]
    var count = 0
    
    func addView(identified: String) {
        viewDic[count] = identified
        count += 1
    }
    
    func getView(identified: String) -> Int? {
        for i in viewDic {
            if i.value == identified {
                return i.key
            }
        }
        return nil
    }
}

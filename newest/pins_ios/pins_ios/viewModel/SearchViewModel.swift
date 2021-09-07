//
//  SearchViewModel.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/03.
//

import UIKit

class SearchViewModel: SearchVCUI {
    // MARK:- Private Variable
    private var keyword = ""
    
    public func getCancel() -> UIButton {
        return cancelButton
    }
    
    public func getKeyword() -> String {
        return keyword
    }
    public func setKeyword(keyword: String) {
        self.keyword = keyword
    }
}

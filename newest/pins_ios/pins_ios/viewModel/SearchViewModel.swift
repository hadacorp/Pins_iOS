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
    private var places: [Place]?
    
    public func getPlaces() -> [Place]{
        return places ?? []
    }
    public func setPlaces(places: [Place]){
        self.places = places
    }
    public func getPlacesIndex(index: Int) -> Place?{
        if let places = places{
            return places[index]
        }
        return nil
    }
    public func getCountPlaces() -> Int{
        if let places = places{
            return places.count
        }
        return 0
    }
    public func resetPlaces() {
        self.places?.removeAll()
    }
    
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

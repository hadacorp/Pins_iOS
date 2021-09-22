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
            if places.count > index {
                return places[index]
            }
            return nil
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
    
    public func getAllDatas() -> [RecentResearchTerm]{
        let datas: [RecentResearchTerm] = CoreDataManager.shared.getUsers()
        let terms: [String] = datas.map({$0.term!})
        let id: [Int16] = datas.map({$0.index})
        print("all terms = \(terms)")
        print("all ids = \(id)")
        return datas
    }
    
    public func saveData(_ id: Int16, term: String, type: Int16){
        CoreDataManager.shared.saveRecentSearch(term: term, index: id, type: type) { (success) in
            print("saved = \(success)")
        }
    }
    
    public func deleteData(_ id: Int16){
        CoreDataManager.shared.deleteUser(id: id) { (success) in
            print("deleted = \(success)")
        }
    }
}

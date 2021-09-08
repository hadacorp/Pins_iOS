//
//  Debouncer.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/09.
//
import UIKit
import Foundation

extension SearchViewController {
    func updateSearchResults(text searchText: String) {
        //Invalidate and Reinitialise
        self.searchTimer?.invalidate()
        
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.15
                                           , repeats: false, block: { (timer) in
            DispatchQueue.global(qos: .userInteractive).async {
                //Use search text and perform the query
                DispatchQueue.main.async {
                    //Update UI
                    self.updateSearchText()
                }
            }
        })
    }
    
    public func updateSearchText(){
        GetPlaceKeyword().requestGet(keyword: searchText) { [self] (success, data) in
            if success{
                self.viewModel.setPlaces(places: data as! [Place])
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

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
                    if searchText.count > 1{
                        self.tableView.snp.updateConstraints { view in
                            view.top.equalTo(self.view).offset(120)
                        }
                        // 입력된 값이 있으면 키워드 텍스트 변경
                        self.keyWordText.layer.opacity = 1
                        self.keyWordText.setTitle("'\(searchText)'를 키워드로 검색", for: .normal)
                        self.tagImage.layer.opacity = 1
                        self.updateSearchText()
                    }
                    else{
                        self.searchText = ""
                        // 키워드 텍스트 변경
                        self.keyWordText.layer.opacity = 0
                        self.tagImage.layer.opacity = 0
                        self.updateSearchText()
                    }
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

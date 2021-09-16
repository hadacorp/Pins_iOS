//
//  SearchViewEventManager.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/03.
//

import UIKit

extension SearchViewController{
    @objc func cancelButton(){
        searchBar.text = ""
        self.searchText = ""
        
        updateSearchResults(text: searchText)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.right:
                // 스와이프 시, 원하는 기능 구현.
                self.dismiss(animated: true, completion: nil)
            default: break
            }
        }
    }
    
    func getSearchKeywordPins(){
        let preVC = self.navigationController?.viewControllers[0] as! ViewController
        preVC.paramLongitude = longitude
        preVC.paramLatitude = latitude
        preVC.paramSearchText = searchText
        preVC.paramType = 0
        self.navigationController?.popViewController(animated: true)
    }
}

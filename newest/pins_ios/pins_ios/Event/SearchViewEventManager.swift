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
    
    func removeDuplicate(indexPath: IndexPath?, latitude: Double, longitude: Double){
        // 만약에 item term이랑 같은 테이블이 있다면 안넣음.
        var check = false
        if let indexPath = indexPath{
            for item in viewModel.getAllDatas() {
                if item.term == "\((viewModel.getPlacesIndex(index: indexPath.row)?.placeName)!)"{
                    check = true
                }
            }
            if !check {
                viewModel.saveData(Int16(viewModel.getAllDatas().count),
                                   term: "\((viewModel.getPlacesIndex(index: indexPath.row)?.placeName)!)",
                                   type: 0,
                                   longitude: longitude,
                                   latitude: latitude)
            }
        }
        else{
            for item in viewModel.getAllDatas() {
                if item.term == "'\(searchText)'"{
                    check = true
                }
            }
            if !check {
                viewModel.saveData(Int16(viewModel.getAllDatas().count), term: "'\(searchText)'", type: 1,
                                   longitude: longitude,
                                   latitude: latitude)
            }
        }
    }
    
    func getSearchKeywordPins(){
        removeDuplicate(indexPath: nil, latitude: latitude, longitude: longitude)
        let preVC = self.navigationController?.viewControllers[1] as! ViewController
        preVC.paramLongitude = longitude
        preVC.paramLatitude = latitude
        preVC.paramSearchText = searchText
        preVC.paramType = 0
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func deletedata(_ sender: AnyObject?) {
        // 원하는 대로 코드 구성
        viewModel.deleteData(Int16(viewModel.getCoreDataCount() - 1) - Int16((sender?.tag!)!))
        tableView.reloadData()
    }
}

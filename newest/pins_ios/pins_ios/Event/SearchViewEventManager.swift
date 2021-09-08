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
        viewModel.resetPlaces()
        tableView.reloadData()
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
}

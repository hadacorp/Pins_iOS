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
        
        // 키워드 텍스트 변경
        keyWordText.layer.opacity = 0
        tagImage.layer.opacity = 0
        
        cells.removeAll()
        coordinates.removeAll()
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

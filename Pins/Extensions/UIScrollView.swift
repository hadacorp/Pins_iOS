//
//  UIScrollView.swift
//  Pins
//
//  Created by judongseok on 2021/08/01.
//
import UIKit

extension MainViewController{
    func simillerValue() -> Int{
        var array: [Int] = []
        for i in 0 ..< viewModel.joinCardList.count{
            array.append((Int(UIScreen.main.bounds.width - 24) * i))
        }
        var less = Int.max
        var goal = 0
        for i in 0 ..< array.count{
            let value = abs(Int(scrollView.contentOffset.x) - array[i])
            if less > value{
                less = value
                goal = array[i]
            }
        }
        return goal
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView == self.scrollView && scrollView.isDecelerating == true){
            let goal = simillerValue()
            UIView.animate(withDuration: 0.5) {
                print("anime to" + String(goal))
                scrollView.scrollRectToVisible(CGRect(x: CGFloat(goal), y: 0, width: scrollView.bounds.size.width, height: scrollView.bounds.size.height), animated: false)
            }
        }
    }
}

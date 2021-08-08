//
//  UIScrollView.swift
//  Pins
//
//  Created by judongseok on 2021/08/01.
//
import UIKit

extension MainViewController{
    
    func simillerValue() -> [Int]{
        var array: [Int] = []
        for i in 0 ..< viewModel.joinCardList.count{
            array.append((Int(UIScreen.main.bounds.width - 24) * i))
        }
        return array
    }
    
    func scroll(){
        DispatchQueue.main.async{
            let goal = self.simillerValue()
            UIView.animate(withDuration: 2) {
                self.scrollView.setContentOffset(CGPoint(x: goal[self.joinPage], y: 0), animated: true)
            }
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if(scrollView == self.scrollView){
            vector = vector - Int(scrollView.contentOffset.x)
            if(vector < -40 && joinPage < viewModel.joinCardList.count - 1){
                joinPage += 1
                scroll()
            }
            if(vector > 40 && joinPage > 0){
                joinPage -= 1
                scroll()
            }
            else{
                scroll()
            }
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if(scrollView == self.scrollView){
            vector = Int(scrollView.contentOffset.x)
        }
    }
}

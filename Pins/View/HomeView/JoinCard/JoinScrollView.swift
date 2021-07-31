//
//  JoinScrollView.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit

class JoinScrollView{
    // background
    private let joinBackgroundView = JoinBackgroundView()
    // cardview
    private let joinCardView = JoinCardView()
    // scrollView
    
    func initial(scrollView: UIScrollView, parent: UIView, constraint: UIView, width: Int, cardList: [JoinCardModel]){
        joinBackgroundView.initial(parent: parent, constraint: constraint)
        joinCardView.initial(cardList: cardList, scrollView: scrollView)
        
        joinBackgroundView.background.addSubview(scrollView)
        scrollView.snp.makeConstraints { (scroll) in
            scroll.top.equalTo(joinBackgroundView.background).offset(40)
            scroll.height.equalTo(132)
            scroll.width.equalTo(parent)
            scroll.centerX.equalTo(parent)
        }
        print(width)
        scrollView.contentSize = CGSize(width: width, height: 100)
        scrollView.showsHorizontalScrollIndicator = false
    }
}
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

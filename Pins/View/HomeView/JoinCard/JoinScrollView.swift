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
        print(width)
        joinBackgroundView.background.addSubview(scrollView)
        scrollView.snp.makeConstraints { (scroll) in
            scroll.top.equalTo(joinBackgroundView.background).offset(40)
            scroll.height.equalTo(132)
            scroll.width.equalTo(parent)
            scroll.centerX.equalTo(parent)
        }
        scrollView.contentSize = CGSize(width: width, height: 100)
        scrollView.showsHorizontalScrollIndicator = false
    }
}

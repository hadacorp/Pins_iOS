//
//  PromiseScrollView.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit

class PromiseScrollView {
    // 메인 뷰 약속 카드 뷰
    private let promiseCardView = PromiseCardView()
    
    let scrollView = UIScrollView()
    func initial(promiseText: UIView, view: UIView, width: Int, cardList: [PromiseCardModel]){
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (scroll) in
            scroll.top.equalTo(promiseText).offset(26)
            scroll.height.equalTo(256)
            scroll.width.equalTo(view)
        }
        
        scrollView.contentSize = CGSize(width: width, height: 224)
        scrollView.showsHorizontalScrollIndicator = false
        
        promiseCardView.initial(cardList: cardList, scrollView: scrollView)
    }
}

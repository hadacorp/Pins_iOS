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
    private let promiseArea = UIView()
    private let promiseText = UILabel()
    let scrollView = UIScrollView()
    func initial(view: UIView, parent: UIView, width: Int, cardList: [PromiseCardModel]){
        view.addSubview(promiseArea)
        promiseArea.snp.makeConstraints { (area) in
            area.bottom.equalTo(parent).offset(296)
            area.height.equalTo(296)
            area.width.equalTo(view)
        }
        promiseArea.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        
        promiseArea.addSubview(promiseText)
        promiseText.snp.makeConstraints { (text) in
            text.top.equalTo(promiseArea).offset(14)
            text.leading.equalTo(16)
        }
        
        promiseText.text = "약속 잊으신 건 아니죠?"
        promiseText.font = UIFont(name: "NotoSansKR-Bold", size: 18)
        promiseText.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        promiseArea.addSubview(scrollView)
        scrollView.snp.makeConstraints { (scroll) in
            scroll.bottom.equalTo(promiseText).offset(256)
            scroll.height.equalTo(256)
            scroll.width.equalTo(view)
        }
        scrollView.contentSize = CGSize(width: width, height: 224)
        scrollView.showsHorizontalScrollIndicator = false
        
        promiseCardView.initial(cardList: cardList, scrollView: scrollView)
    }
}

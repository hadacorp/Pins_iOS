//
//  PromiseCardView.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit
import SnapKit

class PromiseCardView {
    // 약속 카드에 들어갈 자식 뷰들
    let promiseCardTitleView = PromiseCardTitleView()
    let promiseCardTagView = PromiseCardTagView()
    let promiseCardThumbnail = PromiseCardThumbnailView()
    let promiseCardTime = PromiseCardTimeView()
    
    // 약속 카드뷰 생성
    func initial(cardList: [PromiseCardModel], scrollView: UIScrollView){
        for i in 0 ..< cardList.count {
            let background = UIView()
            addSubViewToScrollView(card: cardList[i], scrollView: scrollView, index: i, background: background)
            
            promiseCardTitleView.initial(card: cardList[i], background: background)
            promiseCardTagView.initial(card: cardList[i], background: background)
            promiseCardThumbnail.initial(card: cardList[i], background: background)
            promiseCardTime.initial(card: cardList[i], background: background)
        }
    }
    
    // 약속 카드 배경에 요소들 add
    func addSubViewToScrollView(card: PromiseCardModel, scrollView: UIScrollView, index: Int, background: UIView) {
        background.addSubview(card.simbolPin)
        background.addSubview(card.tag)
        background.addSubview(card.thumbnail)
        background.addSubview(card.title)
        background.addSubview(card.time)
        
        scrollView.addSubview(background)
        
        background.snp.makeConstraints { (bg) in
            bg.leading.equalTo(16 + (172 * index))
            bg.top.equalTo(8)
            bg.width.equalTo(164)
            bg.height.equalTo(224)
        }
        
        background.backgroundColor = .white
        background.layer.cornerRadius = 16
        background.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), alpha: 0.08, x: 0, y: 8, blur: 16, spread: 0)
    }
}

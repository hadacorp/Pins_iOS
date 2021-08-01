//
//  JoinCardView.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit

class JoinCardView {
    // 참가 신청 핀 안에 있는 요소들
    let joinCardTagView = JoinCardTagView()
    let joinCardTitleView = JoinCardTitleView()
    let joinCardTimeView = JoinCardTimeView()
    let joinCardThumbnail = JoinCardThumbnailView()
    
    func initial(cardList: [JoinCardModel], scrollView: UIScrollView){
        // 요소 초기화
        for i in 0 ..< cardList.count{
            let background = UIView()
            addSubViewToScrollView(card: cardList[i], scrollView: scrollView, index: i, background: background)
            
            joinCardTagView.initial(card: cardList[i], background: background)
            joinCardTitleView.initial(card: cardList[i], background: background)
            joinCardTimeView.initial(card: cardList[i], background: background)
            joinCardThumbnail.initial(card: cardList[i], background: background)
        }
    }
    
    // 조인 카드 배경에 요소들 add
    func addSubViewToScrollView(card: JoinCardModel, scrollView: UIScrollView, index: Int, background: UIView){
        let width = UIScreen.main.bounds.width - 32
        background.addSubview(card.simbolPin)
        
        scrollView.addSubview(background)
        scrollView.addSubview(card.tag)
        scrollView.addSubview(card.title)
        scrollView.addSubview(card.time)
        scrollView.addSubview(card.thumbnail)
        
        background.snp.makeConstraints { (bg) in
            bg.leading.equalTo(16 + (Int(width) + 8) * index)
            bg.top.equalTo(8)
            bg.width.equalTo(width)
            bg.height.equalTo(100)
        }
        background.backgroundColor = .white
        background.layer.cornerRadius = 16
        background.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), alpha: 0.08, x: 0, y: 8, blur: 16, spread: 0)
    }
}

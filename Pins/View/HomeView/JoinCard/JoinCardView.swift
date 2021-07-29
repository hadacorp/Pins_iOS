//
//  JoinCardView.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit

class JoinCardView {
    // 참가 신청 핀 안에 있는 요소들
    
    func initial(cardList: [JoinCardModel], scrollView: UIScrollView){
        // 요소 초기화
        for i in 0 ..< cardList.count{
            let background = UIView()
            addSubViewToScrollView(card: cardList[i], scrollView: scrollView, index: i, background: background)
        }
    }
    
    // 조인 카드 배경에 요소들 add
    func addSubViewToScrollView(card: JoinCardModel, scrollView: UIScrollView, index: Int, background: UIView){
        let width = UIScreen.main.bounds.width - 32
        background.addSubview(card.simbolPin)
        
        scrollView.addSubview(background)
        
        background.snp.makeConstraints { (bg) in
            bg.leading.equalTo(16 + (Int(width) + 8) * index)
            bg.top.equalTo(8)
            bg.width.equalTo(width)
            bg.height.equalTo(100)
        }
    }
}

//
//  PromiseScrollView.swift
//  Pins
//
//  Created by judongseok on 2021/07/29.
//

import UIKit

class PromiseScrollView: NSObject {
    func initScrollView(scrollView: UIScrollView, view: UIView, width: Int){
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (scroll) in
            scroll.top.equalTo(366)
            scroll.height.equalTo(256)
            scroll.width.equalTo(view)
        }
        
        scrollView.contentSize = CGSize(width: width, height: 224)
        scrollView.showsHorizontalScrollIndicator = false
    }
}

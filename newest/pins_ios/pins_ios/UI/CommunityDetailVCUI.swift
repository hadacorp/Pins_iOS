//
//  CommunityDetailVCUI.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/14.
//

import UIKit

class CommunityDetailVCUI {
    private var view: UIView!
    private var scrollView: UIScrollView!
    
    init(parent: UIScrollView, view: UIView) {
        self.scrollView = parent
        self.view = view
    }
    
    public func setUI(){
        createTriangle()
    }
    
    // 상단 작은 삼각형 생성
    public func createTriangle(){
        let blueTri = UIImageView(image: UIImage(named: "iconTriangleBlue"))
        let whiteTri = UIImageView(image: UIImage(named: "iconTriangleWhite"))
        
        self.view.addSubview(blueTri)
        self.view.addSubview(whiteTri)
        
        whiteTri.snp.makeConstraints { make in
            make.width.equalTo(4)
            make.height.equalTo(6)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.leading.equalTo(UIScreen.main.bounds.width / 3 - 2)
        }
        
        blueTri.snp.makeConstraints { make in
            make.width.equalTo(4)
            make.height.equalTo(6)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.trailing.equalTo(-UIScreen.main.bounds.width / 3 + 2)
        }
    }
}

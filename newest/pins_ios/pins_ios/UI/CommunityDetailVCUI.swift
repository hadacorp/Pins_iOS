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
        meetSectionText(title: "카테고리", top: 16)
        subtitle(title: "(생성 후 변경 불가)", top: 17, leading: 70)
        createTriangle()
        createLine(top: 260)
        meetSectionText(title: "참가 방식", top: 284)
        createLine(top: 372)
        meetSectionText(title: "프로필 방식", top: 396)
        subtitle(title: "(생성 후 변경 불가)", top: 397, leading: 86)
        createLine(top: 484)
        meetSectionText(title: "참가 가능 성별", top: 508)
        createLine(top: 596)
        meetSectionText(title: "참가 가능 나이", top: 620)
    }
    // MARK:- 상단 작은 삼각형 생성
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
    // MARK:- 오른쪽 메인 텍스트
    public func meetSectionText(title: String, top: Int){
        let text = UILabel()
        scrollView.addSubview(text)
        text.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(20)
            make.top.equalTo(top)
            make.leading.equalTo(16)
        }
        text.text = title
        text.font = UIFont(name: "NotoSansKR-Medium", size: 14)
    }
    
    // MARK:- 오른쪽 상세 정보 텍스트
    public func subtitle(title: String, top: Int, leading: Int){
        let text = UILabel()
        scrollView.addSubview(text)
        text.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(20)
            make.top.equalTo(top)
            make.leading.equalTo(leading)
        }
        text.text = title
        text.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        text.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    }
    // MARK:- 중간 라인
    public func createLine(top: Int){
        let line = UIView()
        scrollView.addSubview(line)
        line.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.height.equalTo(8)
            make.leading.equalTo(0)
            make.top.equalTo(top)
        }
        line.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    }
}

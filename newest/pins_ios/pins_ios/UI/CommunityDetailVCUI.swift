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
    
    public let ageDescription = UILabel()
    public let nextButton = UIButton()
    
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
        meetSectionDescriptionText(label: ageDescription, title: "20세 ~ 무제한", top: 620)
        detailText(top: 696, leading: 32, trailing: 0, position: 0, text: "20세")
        detailText(top: 696, leading: 0, trailing: 0, position: 1, text: "35세")
        detailText(top: 696, leading: 0, trailing: 32, position: 2, text: "무제한")
        initNextButton()
    }
    
    // pos : 0 왼쪽, 1 중앙, 2 오른쪽
    public func detailText(top: CGFloat, leading: CGFloat, trailing: CGFloat, position: Int, text: String){
        let dash = UIView()
        scrollView.addSubview(dash)
        dash.snp.makeConstraints { dash in
            dash.width.equalTo(1)
            dash.height.equalTo(4)
            dash.top.equalTo(top)
            if position == 0{
                dash.leading.equalTo(leading)
            }
            else if position == 1{
                dash.centerX.equalTo(scrollView)
            }
            else if position == 2{
                dash.trailing.equalTo(UIScreen.main.bounds.width - trailing)
            }
        }
        dash.backgroundColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        
        let label = UILabel()
        dash.addSubview(label)
        label.snp.makeConstraints { text in
            text.top.equalTo(dash).offset(4)
            text.centerX.equalTo(dash)
            text.width.equalTo(50)
            text.height.equalTo(18)
        }
        label.text = text
        label.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        label.textColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        label.textAlignment = .center
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
    
    // MARK:- 왼쪽 상세 정보 텍스트
    public func meetSectionDescriptionText(label: UILabel, title: String, top: Int){
        scrollView.addSubview(label)
        label.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(20)
            make.top.equalTo(top)
            make.trailing.equalTo(self.view).offset(-16)
        }
        label.text = title
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        label.textColor = UIColor(named: "skyBlue")
        label.textAlignment = .right
    }
    
    public func initNextButton(){
        self.view.addSubview(nextButton)
        nextButton.snp.makeConstraints { btn in
            btn.leading.equalTo(16)
            btn.width.equalTo(UIScreen.main.bounds.width - 32)
            btn.height.equalTo(41)
            btn.bottom.equalTo(view.safeAreaLayoutGuide).offset(-4)
        }
        nextButton.setTitle("다음 단계", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        nextButton.titleLabel?.textAlignment = .center
        nextButton.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nextButton.layer.cornerRadius = 8
        nextButton.backgroundColor = #colorLiteral(red: 0.5568627451, green: 0.8156862745, blue: 0.9490196078, alpha: 1)
    }
}

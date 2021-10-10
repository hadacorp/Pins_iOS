//
//  MeetingDetailVCUI.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/10.
//

import UIKit

// MARK: - UISetting
class MeetingDetailVCUI{
    
    public let hourPlusButton = UIButton()
    public let hourMinusButton = UIButton()
    public let minutePlusButton = UIButton()
    public let minuteMinusButton = UIButton()
    
    public let hourLabel = UILabel()
    public let minuteLabel = UILabel()
    
    public let dateDescription = UILabel()
    public let timeDescription = UILabel()
    public let countDescription = UILabel()
    public let ageDescription = UILabel()
    
    private var view: UIView!
    private var scrollView: UIScrollView!
    
    init(view: UIView, scrollView: UIScrollView) {
        self.view = view
        self.scrollView = scrollView
    }
    
    public func setUI(){
        createTriangle()
        meetSectionText(title: "카테고리", top: 16)
        createLine(top: 260)
        meetSectionText(title: "만남 날짜", top: 284)
        meetSectionDescriptionText(label: dateDescription, title: "날짜를 선택해 주세요", top: 284)
        createLine(top: 429)
        meetSectionText(title: "만남 시각", top: 453)
        meetSectionDescriptionText(label: timeDescription, title: "오후 5:00", top: 453)
        createLine(top: 616)
        meetSectionText(title: "참가 가능 성별", top: 640)
        createLine(top: 728)
        meetSectionText(title: "모집 인원", top: 752)
        meetSectionDescriptionText(label: countDescription, title: "1명", top: 752)
        joinTime()
        createLine(top: 873)
        meetSectionText(title: "참가 가능 나이", top: 897)
        meetSectionDescriptionText(label: ageDescription, title: "20세 ~ 무제한", top: 897)
    }
    // MARK:- 상단 작은 삼각형
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
        label.font = UIFont(name: "NotoSansKR-Light", size: 14)
        label.textColor = UIColor(named: "skyBlue")
        label.textAlignment = .right
    }
    
    // MARK:- 만남 시각
    public func joinTime(){
        let hourBackgroundTop = UIView()
        let hourBackgroundDown = UIView()
        
        let minuteBackgroundTop = UIView()
        let minuteBackgroundDown = UIView()
        
        let hourSeparator = UIImageView()
        let minuteSeparator = UIImageView()
        
        
        scrollView.addSubview(hourBackgroundTop)
        scrollView.addSubview(hourBackgroundDown)
        
        scrollView.addSubview(minuteBackgroundTop)
        scrollView.addSubview(minuteBackgroundDown)
        
        // HOUR TOP
        hourBackgroundTop.snp.makeConstraints { bg in
            bg.leading.equalTo(16)
            bg.width.equalTo((UIScreen.main.bounds.width - 48) / 2)
            bg.height.equalTo(48)
            bg.top.equalTo(496)
        }
        hourBackgroundTop.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        hourBackgroundTop.roundCorners(cornerRadius: 16, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        // HOUR DOWN
        hourBackgroundDown.snp.makeConstraints { bg in
            bg.leading.equalTo(16)
            bg.width.equalTo((UIScreen.main.bounds.width - 48) / 2)
            bg.height.equalTo(48)
            bg.top.equalTo(544)
        }
        hourBackgroundDown.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        hourBackgroundDown.layer.borderWidth = 1
        hourBackgroundDown.layer.borderColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        hourBackgroundDown.roundCorners(cornerRadius: 16, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        
        // MINUTE TOP
        minuteBackgroundTop.snp.makeConstraints { bg in
            bg.trailing.equalTo(UIScreen.main.bounds.width - 16)
            bg.width.equalTo((UIScreen.main.bounds.width - 48) / 2)
            bg.height.equalTo(48)
            bg.top.equalTo(496)
        }
        minuteBackgroundTop.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        minuteBackgroundTop.roundCorners(cornerRadius: 16, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        // MIUNTE DOWN
        minuteBackgroundDown.snp.makeConstraints { bg in
            bg.trailing.equalTo(UIScreen.main.bounds.width - 16)
            bg.width.equalTo((UIScreen.main.bounds.width - 48) / 2)
            bg.height.equalTo(48)
            bg.top.equalTo(544)
        }
        minuteBackgroundDown.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        minuteBackgroundDown.layer.borderWidth = 1
        minuteBackgroundDown.layer.borderColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        minuteBackgroundDown.roundCorners(cornerRadius: 16, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        
        // 플, 마 버튼
        hourPlusButton.setImage(#imageLiteral(resourceName: "iconMeetPlus"), for: .normal)
        minutePlusButton.setImage(#imageLiteral(resourceName: "iconMeetPlus"), for: .normal)
        hourMinusButton.setImage(#imageLiteral(resourceName: "iconMeetMinus"), for: .normal)
        minuteMinusButton.setImage(#imageLiteral(resourceName: "iconMeetMinus"), for: .normal)
        
        hourBackgroundDown.addSubview(hourPlusButton)
        hourBackgroundDown.addSubview(hourMinusButton)
        
        minuteBackgroundDown.addSubview(minutePlusButton)
        minuteBackgroundDown.addSubview(minuteMinusButton)
        
        hourPlusButton.snp.makeConstraints { btn in
            btn.trailing.equalTo(-31)
            btn.top.equalTo(14)
            btn.width.equalTo(20)
            btn.height.equalTo(20)
        }
        
        hourMinusButton.snp.makeConstraints { btn in
            btn.leading.equalTo(31)
            btn.top.equalTo(14)
            btn.width.equalTo(20)
            btn.height.equalTo(20)
        }
        
        minutePlusButton.snp.makeConstraints { btn in
            btn.trailing.equalTo(-31)
            btn.top.equalTo(14)
            btn.width.equalTo(20)
            btn.height.equalTo(20)
        }
        
        minuteMinusButton.snp.makeConstraints { btn in
            btn.leading.equalTo(31)
            btn.top.equalTo(14)
            btn.width.equalTo(20)
            btn.height.equalTo(20)
        }
        
        // 구분 선
        hourBackgroundDown.addSubview(hourSeparator)
        hourSeparator.image = #imageLiteral(resourceName: "iconSeparator")
        hourSeparator.snp.makeConstraints { line in
            line.centerX.equalTo(hourBackgroundDown)
            line.width.equalTo(1)
            line.height.equalTo(32)
            line.top.equalTo(8)
        }
        
        minuteBackgroundDown.addSubview(minuteSeparator)
        minuteSeparator.image = #imageLiteral(resourceName: "iconSeparator")
        minuteSeparator.snp.makeConstraints { line in
            line.centerX.equalTo(minuteBackgroundDown)
            line.width.equalTo(1)
            line.height.equalTo(32)
            line.top.equalTo(8)
        }
        
        // time label
        hourBackgroundTop.addSubview(hourLabel)
        hourLabel.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        hourLabel.textColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
        hourLabel.text = "오후 5시"
        hourLabel.textAlignment = .center
        hourLabel.snp.makeConstraints { label in
            label.leading.equalTo(0)
            label.trailing.equalTo(0)
            label.top.equalTo(12)
        }
        
        minuteBackgroundTop.addSubview(minuteLabel)
        minuteLabel.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        minuteLabel.textColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
        minuteLabel.text = "00분"
        minuteLabel.textAlignment = .center
        minuteLabel.snp.makeConstraints { label in
            label.leading.equalTo(0)
            label.trailing.equalTo(0)
            label.top.equalTo(12)
        }
    }
}

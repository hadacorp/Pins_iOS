//
//  CardDetailViewController.swift
//  Pins
//
//  Created by judongseok on 2022/02/12.
//

import UIKit

class CardDetailViewController: BaseViewController {
    // MARK: - Property
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func setupUI() {
        // MARK: - 상단 네비게이션 뷰
        CustomButton(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
                $0.width.equalTo(10)
                $0.height.equalTo(20)
            }
            .setImage(image: UIImage(named: "smallBack")!)
            .setAction(parent: self, action: #selector(backBtn))
        
        CustomLabel(parent: self.view)
            .makeConstraints {
                $0.centerX.equalTo(self.view)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            }
            .setText(text: "만남 핀")
            .setFont(name: "NotoSansKR-Medium", size: 16)
            .setColor(color: .black)
        
        CustomButton(parent: self.view)
            .makeConstraints{
                $0.trailing.equalTo(-16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
                $0.width.equalTo(10)
                $0.height.equalTo(16)
            }
            .setImage(image: UIImage(named: "btnMore")!)
        
        CustomView(parent: self.view)
            .makeConstraints {
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(53.5)
                $0.width.equalTo(self.view)
                $0.height.equalTo(0.5)
            }
            .setColor(color: UIColor(hex: "DEDEDE"))
        // MARK: - 중단 콘텐츠 부분
        CustomImage(parent: self.view)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(70)
                $0.width.height.equalTo(35)
            }
            .setImage(image: UIImage(named: "catimage")!)
            .setRadius(size: 17.5)
        
        CustomLabel(parent: self.view)
            .makeConstraints {
                $0.leading.equalTo(59)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(70)
                $0.height.equalTo(14)
            }
            .setText(text: "가나라다마바사사사")
            .setFont(name: "NotoSansKR-Regular", size: 13)
            .setColor(color: .black)
        
        CustomLabel(parent: self.view)
            .makeConstraints {
                $0.leading.equalTo(59)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(92)
                $0.height.equalTo(13)
            }
            .setText(text: "25세 남자")
            .setFont(name: "NotoSansKR-Regular", size: 13)
            .setColor(color: UIColor.init(hex: "999999"))
        
        CustomLabel(parent: self.view)
            .makeConstraints {
                $0.trailing.equalTo(-16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(70)
                $0.width.equalTo(Category().accident)
            }
            .setFont(name: "NotoSansKR-Regular", size: 12)
            .setText(text: "사건사고")
            .setBackgroundColor(color: UIColor.init(hex: "#1059FF"))
            .setColor(color: .white)
            .setRadius(size: 10)
            .setAlignment(alignment: .center)
        
        let mainContent = CustomLabel(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(16)
                $0.trailing.equalTo(-16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(127)
            }
            .setText(text: "광교호수공원에서 강아지 산책해용 저는 말티즈 키우고 있어용 제가 자주 가는 코스로 모셔볼게요~~!! 두시간 정도 생각하고 있는데 ")
            .setFont(name: "NotoSansKR-Regular", size: 15)
            .setLineHeight(size: 10)
        
        CustomLabel(parent: self.view)
            .makeConstraints {
                $0.leading.equalTo(16)
                // 한줄에 높이 22로 계산
                $0.top.equalTo(mainContent.snp.bottom).offset(32)
                $0.height.equalTo(17)
            }
            .setText(text: "39분 전")
            .setFont(name: "NotoSansKR-Regular", size: 12)
            .setColor(color: UIColor.init(hex: "AFAFAF"))
        
        CustomView(parent: self.view)
            .makeConstraints {
                $0.top.equalTo(mainContent.snp.bottom).offset(64.5)
                $0.width.equalTo(self.view)
                $0.height.equalTo(0.5)
            }
            .setColor(color: UIColor(hex: "DEDEDE"))
        
        
        // MARK: - 중단 정보 뷰
        CustomLabel(parent: self.view)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(mainContent.snp.bottom).offset(81)
                $0.height.equalTo(22)
            }
            .setText(text: "정보")
            .setFont(name: "NotoSansKR-Medium", size: 16)
        
        CustomImage(parent: self.view)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(mainContent.snp.bottom).offset(119)
            }
            .setImage(image: UIImage(named: "iconInteration")!)
        
        CustomImage(parent: self.view)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(mainContent.snp.bottom).offset(146)
            }
            .setImage(image: UIImage(named: "iconTime")!)
        
        CustomImage(parent: self.view)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(mainContent.snp.bottom).offset(171)
            }
            .setImage(image: UIImage(named: "iconAge")!)
        
        CustomImage(parent: self.view)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(mainContent.snp.bottom).offset(197)
            }
            .setImage(image: UIImage(named: "iconGender")!)
        
        CustomLabel(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(37)
                $0.top.equalTo(mainContent.snp.bottom).offset(119)
                $0.height.equalTo(15)
            }
            .setText(text: "경기도 수원시 팔달구 243")
            .setFont(name: "NotoSansKR-Regular", size: 13)
        
        CustomLabel(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(37)
                $0.top.equalTo(mainContent.snp.bottom).offset(146)
                $0.height.equalTo(15)
            }
            .setText(text: "오늘 오후 9시")
            .setFont(name: "NotoSansKR-Regular", size: 13)
        
        CustomLabel(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(37)
                $0.top.equalTo(mainContent.snp.bottom).offset(171)
                $0.height.equalTo(15)
            }
            .setText(text: "22살 ~ 26살")
            .setFont(name: "NotoSansKR-Regular", size: 13)
        
        CustomLabel(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(37)
                $0.top.equalTo(mainContent.snp.bottom).offset(197)
                $0.height.equalTo(15)
            }
            .setText(text: "성별 무관")
            .setFont(name: "NotoSansKR-Regular", size: 13)
        
        CustomView(parent: self.view)
            .makeConstraints {
                $0.top.equalTo(mainContent.snp.bottom).offset(225.5)
                $0.width.equalTo(self.view)
                $0.height.equalTo(0.5)
            }
            .setColor(color: UIColor(hex: "DEDEDE"))
        
        // MARK: - 하단 뷰
        
        CustomLabel(parent: self.view)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(mainContent.snp.bottom).offset(242)
                $0.height.equalTo(22)
            }
            .setText(text: "같이 할 사람")
            .setFont(name: "NotoSansKR-Medium", size: 16)
        
        CustomLabel(parent: self.view)
            .makeConstraints {
                $0.trailing.equalTo(-16)
                $0.top.equalTo(mainContent.snp.bottom).offset(245)
            }
            .setText(text: "56/100")
            .setFont(name: "NotoSansKR-Regular", size: 13)
            .setColor(color: UIColor.init(hex: "999999"))
    }
}

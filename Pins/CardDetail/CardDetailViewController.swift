//
//  CardDetailViewController.swift
//  Pins
//
//  Created by judongseok on 2022/02/12.
//

import UIKit

class CardDetailViewController: BaseViewController {
    // MARK: - Property
    let viewModel = CardDetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func setupUI() {
        // MARK: - 최상위 스크롤 뷰
        let scrollView = CustomScrollView(parent: self.view)
            .makeConstraints {
                $0.leading.top.equalTo(self.view.safeAreaLayoutGuide)
                $0.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
            }
            .setBackgroundColor(color: .white)
            .setDelegate(view: self)
        
        let contentsView = CustomView(parent: scrollView)
        
        // MARK: - 상단 네비게이션 뷰
        CustomButton(parent: contentsView)
            .makeConstraints{
                $0.leading.equalTo(16)
                $0.top.equalTo(contentsView.safeAreaLayoutGuide).offset(14)
                $0.width.equalTo(10)
                $0.height.equalTo(20)
            }
            .setImage(image: UIImage(named: "smallBack")!)
            .setAction(parent: self, action: #selector(backBtn))
        
        CustomLabel(parent: contentsView)
            .makeConstraints {
                $0.centerX.equalTo(contentsView)
                $0.top.equalTo(contentsView.safeAreaLayoutGuide).offset(14)
            }
            .setText(text: "만남 핀")
            .setFont(name: "NotoSansKR-Medium", size: 16)
            .setColor(color: .black)
        
        CustomButton(parent: contentsView)
            .makeConstraints{
                $0.leading.equalTo(UIScreenSize.shared.width - 16 - 10)
                $0.top.equalTo(contentsView.safeAreaLayoutGuide).offset(14)
                $0.width.equalTo(10)
                $0.height.equalTo(16)
            }
            .setImage(image: UIImage(named: "btnMore")!)
        
        CustomView(parent: contentsView)
            .makeConstraints {
                $0.top.equalTo(contentsView.safeAreaLayoutGuide).offset(53.5)
                $0.width.equalTo(self.view)
                $0.height.equalTo(0.5)
            }
            .setColor(color: UIColor(hex: "DEDEDE"))
        // MARK: - 중단 콘텐츠 부분
        CustomImage(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(contentsView.safeAreaLayoutGuide).offset(70)
                $0.width.height.equalTo(35)
            }
            .setImage(image: UIImage(named: "catimage")!)
            .setRadius(size: 17.5)
        
        CustomLabel(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(59)
                $0.top.equalTo(contentsView.safeAreaLayoutGuide).offset(70)
                $0.height.equalTo(14)
            }
            .setText(text: "가나라다마바사사사")
            .setFont(name: "NotoSansKR-Regular", size: 13)
            .setColor(color: .black)
        
        CustomLabel(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(59)
                $0.top.equalTo(contentsView.safeAreaLayoutGuide).offset(92)
                $0.height.equalTo(13)
            }
            .setText(text: "25세 남자")
            .setFont(name: "NotoSansKR-Regular", size: 13)
            .setColor(color: UIColor.init(hex: "999999"))
        
        CustomLabel(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(Int(UIScreenSize.shared.width) - 16 - Category().accident)
                $0.top.equalTo(contentsView.safeAreaLayoutGuide).offset(70)
                $0.width.equalTo(Category().accident)
            }
            .setFont(name: "NotoSansKR-Regular", size: 12)
            .setText(text: "사건사고")
            .setBackgroundColor(color: UIColor.init(hex: "#1059FF"))
            .setColor(color: .white)
            .setRadius(size: 10)
            .setAlignment(alignment: .center)
        
        let mainContent = CustomLabel(parent: contentsView)
            .makeConstraints{
                $0.leading.equalTo(16)
                $0.top.equalTo(contentsView.safeAreaLayoutGuide).offset(127)
                $0.width.equalTo(UIScreenSize.shared.width - 32)
            }
            .setText(text: "광교호수공원에서 강아지 산책해용 저는 말티즈 키우고 있어용 제가 자주 가는 코스로 모셔볼게요~~!! 두시간 정도 생각하고 있는데  두시간 정도 생각하고 있는데  두시간 정도 생각하고 있는데  두시간 정도 생각하고 있는데  두시간 정도 생각하고 있는데  두시간 정도 생각하고 있는데  두시간 정도 생각하고 있는데  두시간 정도 생각하고 있는데  두시간 정도 생각하고 있는데  두시간 정도 생각하고 있는데  두시간 정도 생각하고 있는데두시간 정도 생각하고 있는데두시간 정도 생각하고 있는데두시간 정도 생각하고 있는데두시간 정도 생각하고 있는데두시간 정도 생각하고 있는데두시간 정도 생각하고 있는데 ")
            .setFont(name: "NotoSansKR-Regular", size: 15)
            .setLineHeight(size: 0)
        
        CustomLabel(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(16)
                // 한줄에 높이 22로 계산
                $0.top.equalTo(mainContent.snp.bottom).offset(32)
                $0.height.equalTo(17)
            }
            .setText(text: "39분 전")
            .setFont(name: "NotoSansKR-Regular", size: 12)
            .setColor(color: UIColor.init(hex: "AFAFAF"))
        
        CustomView(parent: contentsView)
            .makeConstraints {
                $0.top.equalTo(mainContent.snp.bottom).offset(64.5)
                $0.width.equalTo(contentsView)
                $0.height.equalTo(0.5)
            }
            .setColor(color: UIColor(hex: "DEDEDE"))
        
        
        // MARK: - 중단 정보 뷰
        CustomLabel(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(mainContent.snp.bottom).offset(81)
                $0.height.equalTo(22)
            }
            .setText(text: "정보")
            .setFont(name: "NotoSansKR-Medium", size: 16)
        
        CustomImage(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(mainContent.snp.bottom).offset(119)
            }
            .setImage(image: UIImage(named: "iconInteration")!)
        
        CustomImage(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(mainContent.snp.bottom).offset(146)
            }
            .setImage(image: UIImage(named: "iconTime")!)
        
        CustomImage(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(mainContent.snp.bottom).offset(171)
            }
            .setImage(image: UIImage(named: "iconAge")!)
        
        CustomImage(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(mainContent.snp.bottom).offset(197)
            }
            .setImage(image: UIImage(named: "iconGender")!)
        
        CustomLabel(parent: contentsView)
            .makeConstraints{
                $0.leading.equalTo(37)
                $0.top.equalTo(mainContent.snp.bottom).offset(119)
                $0.height.equalTo(15)
            }
            .setText(text: "경기도 수원시 팔달구 243")
            .setFont(name: "NotoSansKR-Regular", size: 13)
        
        CustomLabel(parent: contentsView)
            .makeConstraints{
                $0.leading.equalTo(37)
                $0.top.equalTo(mainContent.snp.bottom).offset(146)
                $0.height.equalTo(15)
            }
            .setText(text: "오늘 오후 9시")
            .setFont(name: "NotoSansKR-Regular", size: 13)
        
        CustomLabel(parent: contentsView)
            .makeConstraints{
                $0.leading.equalTo(37)
                $0.top.equalTo(mainContent.snp.bottom).offset(171)
                $0.height.equalTo(15)
            }
            .setText(text: "22살 ~ 26살")
            .setFont(name: "NotoSansKR-Regular", size: 13)
        
        CustomLabel(parent: contentsView)
            .makeConstraints{
                $0.leading.equalTo(37)
                $0.top.equalTo(mainContent.snp.bottom).offset(197)
                $0.height.equalTo(15)
            }
            .setText(text: "성별 무관")
            .setFont(name: "NotoSansKR-Regular", size: 13)
        
        CustomView(parent: contentsView)
            .makeConstraints {
                $0.top.equalTo(mainContent.snp.bottom).offset(225.5)
                $0.width.equalTo(scrollView)
                $0.height.equalTo(0.5)
            }
            .setColor(color: UIColor(hex: "DEDEDE"))
        
        // MARK: - 하단 뷰
        CustomLabel(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(16)
                $0.top.equalTo(mainContent.snp.bottom).offset(242)
                $0.height.equalTo(22)
            }
            .setText(text: "같이 할 사람")
            .setFont(name: "NotoSansKR-Medium", size: 16)
        
        CustomLabel(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(UIScreenSize.shared.width - 16 - 100)
                $0.width.equalTo(100)
                $0.top.equalTo(mainContent.snp.bottom).offset(245)
            }
            .setText(text: "56/100")
            .setFont(name: "NotoSansKR-Regular", size: 13)
            .setColor(color: UIColor.init(hex: "999999"))
            .setAlignment(alignment: .right)
        
        CustomButton(parent: contentsView)
            .makeConstraints{
                $0.top.equalTo(mainContent.snp.bottom).offset(414)
                $0.leading.equalTo(16)
                $0.trailing.equalTo(-16)
                $0.height.equalTo(40)
            }
            .setColor(color: UIColor.init(hex: "1059FF").cgColor)
            .setTitle(title: "같이 하기")
            .setTitleFont(name: "NotoSansKR-Regular", size: 15)
            .setRounded(size: 15)
            .setShadow(x: 0, y: 4, blur: 4, opacity: 0.16, color: UIColor.black.cgColor)
        
        // 하단 카드 CollectionView
        CustomCollectionView(parent: contentsView)
            .setBackgroundColor(color: .white)
            .makeConstraints {
                $0.leading.equalTo(0)
                $0.top.equalTo(mainContent.snp.bottom).offset(280)
                $0.width.equalTo(UIScreenSize.shared.width)
                $0.height.equalTo(70)
            }
            .setDataSource(view: self)
            .setDelegate(view: self)
            .setRegister(customCell: CardDetailCustomCell.self)
            .setScrollDirection(direction: .horizontal)
            .setScrollIndicate(show: false)
            .setSectionInset(insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
            .setLineSpacing(size: 8)
        
        // 스크롤뷰의 콘텐츠뷰 사이즈 초기화
        contentsView
            .makeConstraints {
                $0.edges.equalTo(0)
                $0.width.equalTo(scrollView)
                $0.height.equalTo(mainContent.snp.height).offset(595)
            }
    }
}

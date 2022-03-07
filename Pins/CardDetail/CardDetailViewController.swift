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
    
    // MARK: - Public Property
    var joinBtn: CustomButton!
    var joinBackground: CustomView!
    var applyBtn: CustomButton!
    var cancelBtn: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setJoinView()
        rxSetup()
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
            .setText(text: viewModel.card.name)
            .setFont(name: "NotoSansKR-Regular", size: 13)
            .setColor(color: .black)
        
        CustomLabel(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(59)
                $0.top.equalTo(contentsView.safeAreaLayoutGuide).offset(92)
                $0.height.equalTo(13)
            }
            .setText(text: viewModel.card.age)
            .setFont(name: "NotoSansKR-Regular", size: 13)
            .setColor(color: UIColor.init(hex: "999999"))
        
        CustomLabel(parent: contentsView)
            .makeConstraints {
                $0.leading.equalTo(Int(UIScreenSize.shared.width) - 16 - Category().accident)
                $0.top.equalTo(contentsView.safeAreaLayoutGuide).offset(70)
                $0.width.equalTo(Category().accident)
            }
            .setFont(name: "NotoSansKR-Regular", size: 12)
            .setText(text: viewModel.card.category)
            .setBackgroundColor(color: UIColor.init(hex: "#1059FF"))
            .setColor(color: .white)
            .setRadius(size: 10)
            .setAlignment(alignment: .center)
        
        
        var mainContent = CustomLabel()
        // 이미지가 있으면
        if viewModel.card.image != nil {
            let image = CustomImage(parent: contentsView)
                .setImage(image: UIImage(named: viewModel.card.image!)!)
                .setContentMode(mode: .scaleAspectFill)
                .makeConstraints{
                    $0.top.equalTo(contentsView.safeAreaLayoutGuide).offset(127)
                    $0.width.height.equalTo(contentsView.snp.width)
                    $0.centerX.equalTo(contentsView)
                }
                
            image.backgroundColor = .red
            
            mainContent = CustomLabel(parent: contentsView)
                .makeConstraints{
                    $0.leading.equalTo(16)
                    $0.top.equalTo(image.snp.bottom).offset(22)
                    $0.width.equalTo(UIScreenSize.shared.width - 32)
                }
                .setText(text: viewModel.card.title)
                .setFont(name: "NotoSansKR-Regular", size: 15)
                .setLineHeight(size: 0)
            
            // 스크롤뷰의 콘텐츠뷰 사이즈 초기화
            contentsView
                .makeConstraints {
                    $0.edges.equalTo(0)
                    $0.width.equalTo(scrollView)
                    $0.height.equalTo(mainContent.snp.height).offset(631 + 22 + UIScreenSize.shared.width)
                }
        }
        // 이미지가 없으면
        else {
            mainContent = CustomLabel(parent: contentsView)
                .makeConstraints{
                    $0.leading.equalTo(16)
                    $0.top.equalTo(contentsView.safeAreaLayoutGuide).offset(127)
                    $0.width.equalTo(UIScreenSize.shared.width - 32)
                }
                .setText(text: viewModel.card.title)
                .setFont(name: "NotoSansKR-Regular", size: 15)
                .setLineHeight(size: 0)
            
            // 스크롤뷰의 콘텐츠뷰 사이즈 초기화
            contentsView
                .makeConstraints {
                    $0.edges.equalTo(0)
                    $0.width.equalTo(scrollView)
                    $0.height.equalTo(mainContent.snp.height).offset(631)
                }
        }
        
        
        
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
            .setText(text: viewModel.card.position)
            .setFont(name: "NotoSansKR-Regular", size: 13)
        
        CustomLabel(parent: contentsView)
            .makeConstraints{
                $0.leading.equalTo(37)
                $0.top.equalTo(mainContent.snp.bottom).offset(146)
                $0.height.equalTo(15)
            }
            .setText(text: viewModel.card.time)
            .setFont(name: "NotoSansKR-Regular", size: 13)
        
        CustomLabel(parent: contentsView)
            .makeConstraints{
                $0.leading.equalTo(37)
                $0.top.equalTo(mainContent.snp.bottom).offset(171)
                $0.height.equalTo(15)
            }
            .setText(text: viewModel.card.ageRange)
            .setFont(name: "NotoSansKR-Regular", size: 13)
        
        CustomLabel(parent: contentsView)
            .makeConstraints{
                $0.leading.equalTo(37)
                $0.top.equalTo(mainContent.snp.bottom).offset(197)
                $0.height.equalTo(15)
            }
            .setText(text: viewModel.card.gender)
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
        
        joinBtn = CustomButton(parent: contentsView)
            .makeConstraints{
                $0.top.equalTo(mainContent.snp.bottom).offset(450)
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
    }
}

import UIKit
import SnapKit
import Foundation

class MainViewController: UIViewController {
    
    // MARK:- @IBOutlet Properties
    // 메인 뷰 배너 아울렛
    @IBOutlet weak var mainViewBanner: UICollectionView!
    @IBOutlet weak var promiseText: UILabel!
    
    // MARK:- Private Properties
    // 뷰 모델 초기화
    private let viewModel = MainViewModel()
    // 메인 뷰 배너 페이지 카운트
    private var nowPage: Int = 0
    // 동적 생성 스크롤 뷰
    private var scrollView = UIScrollView()
    // 메인 뷰 배너 width
    private var bannerWidth = UIScreen.main.bounds.width;
    
    // MARK:- Private Views
    // 메인 뷰 약속 스크롤 뷰
    private let promiseScrollView = PromiseScrollView()
    // 메인 뷰 약속 카드 뷰
    private let promiseCardView = PromiseCardView()
    // 메인 뷰 배너 컨트롤 버튼
    private let bannerCtrlBtnView = BannerCtrlBtnView()
    // MARK:- Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // 델리게이트와 데이터 소스를 어디서 처리할 것인지 작성
        mainViewBanner.delegate = self
        mainViewBanner.dataSource = self
        
        // 배너 자동 스크롤 타이머 적용
        bannerTimer()
        // 배너 컨트롤 버튼 init 적용
        initBannerCtrlBtnList()
        
        
        // 약속 스크롤 뷰 init 적용
        initScrollView()
        // 약속 스크롤에 들어갈 카드뷰 init 적용
        initPromiseCardList()
    }
    
    // MARK:- Banner func
    // 배너 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 4.5, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    
    func positionSetting(){
        // auto scroll position 맞춰주기
        if(mainViewBanner.contentOffset.x <= bannerWidth * 4){
            mainViewBanner.contentOffset.x = bannerWidth *  CGFloat((viewModel.numOfBannerImageList * 2 - 1))
        }
        else if(mainViewBanner.contentOffset.x >= bannerWidth * 10){
            mainViewBanner.contentOffset.x = bannerWidth * CGFloat((viewModel.numOfBannerImageList))
        }
    }
    
    // 배너 움직이는 매서드
    func bannerMove() {
        // 자동으로 움직일 때 포지션 맞춰주기
        positionSetting()
        mainViewBanner.scrollRectToVisible(CGRect(x: mainViewBanner.contentOffset.x + bannerWidth, y: 0, width: mainViewBanner.frame.width, height: mainViewBanner.frame.height), animated: true)
        
        // 자동으로 움직일때 페이지 세팅
        nowPage = (Int(mainViewBanner.contentOffset.x / bannerWidth - 5) + 1) % 5
        changeBannerCtrlBtnColor()
    }
    // 배너 컨트롤 버튼 init
    func initBannerCtrlBtnList(){
        bannerCtrlBtnView.initial(parent: self.view, list: viewModel.bannerCtrlBtnList, anchor: mainViewBanner)
    }
    // 현재 위치한 인덱스의 버튼 색깔 변경
    func changeBannerCtrlBtnColor(){
        // nowPage를 받아와 해당 인덱스 버튼 background opacity 1
        viewModel.changeBannerCtrlBtnBgColor(cur: nowPage)
    }
    
    // MARK:- Promise func
    // 약속 카드 스크롤 뷰 동적 생성
    func initScrollView(){
        scrollView = UIScrollView()
        scrollView.delegate = self
        
        promiseScrollView.initScrollView(scrollView: scrollView, view: view, width: viewModel.numOfPromiseCardList * 172 + 16)
    }
    // 약속 카드 스크롤 안에 들어갈 카드리스트 생성
    func initPromiseCardList(){
        promiseCardView.initial(cardList: viewModel.promiseCardList, scrollView: scrollView)
    }
}

// MARK:- Extensions
// MARK:- CollectionView Setting
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBannerImageList * 3
    }
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainViewBanner.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        
        var index = indexPath.item
        if index > viewModel.numOfBannerImageList - 1 {
            index -= viewModel.numOfBannerImageList
        }
        cell.imageView.image = viewModel.bannerImageList[index % viewModel.numOfBannerImageList].image
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.contentOffset = CGPoint(x: Int(bannerWidth) * viewModel.numOfBannerImageList, y: 0)
        return CGSize(width: mainViewBanner.frame.width, height: mainViewBanner.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 직접 스크롤 했을 때 포지션 세팅
        positionSetting()
        // 직접 스크롤 했을 때 페이지 세팅
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        nowPage = nowPage % viewModel.numOfBannerImageList
        // 스크롤로 변경했을 때 버튼 변경
        changeBannerCtrlBtnColor()
    }
}

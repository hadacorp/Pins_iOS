import UIKit
import SnapKit
import Foundation

class MainViewController: UIViewController {
    
    // MARK:- @IBOutlet Properties
    // 메인 뷰 배너 아울렛
    @IBOutlet weak var mainViewBanner: UICollectionView!
    
    // MARK:- Public Properties
    // 뷰 모델 초기화
    public let viewModel = MainViewModel()
    // 메인 뷰 배너 width
    public var bannerWidth = UIScreen.main.bounds.width;
    // 메인 뷰 배너 페이지 카운트
    public var nowPage: Int = 0
    
    // MARK:- Private Views
    // 메인 뷰 약속 스크롤 뷰
    private let promiseScrollView = PromiseScrollView()
    // 메인 뷰 배너 컨트롤 버튼
    private let bannerCtrlBtnView = BannerCtrlBtnView()
    
    // MARK:- Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // 배너 자동 스크롤 타이머 적용
        initBannerCollectionView()
        // 배너 컨트롤 버튼 init 적용
        initBannerCtrlBtnList()
        // 약속 스크롤 뷰 init 적용
        initScrollView()
    }
    
    // MARK:- Banner func
    func initBannerCollectionView(){
        // 델리게이트와 데이터 소스를 어디서 처리할 것인지 작성
        mainViewBanner.delegate = self
        mainViewBanner.dataSource = self
        bannerTimer()
    }
    
    // 배너 컨트롤 버튼 init
    func initBannerCtrlBtnList(){
        bannerCtrlBtnView.initial(parent: self.view, list: viewModel.bannerCtrlBtnList, anchor: mainViewBanner)
    }
    
    // MARK:- Promise func
    // 약속 카드 스크롤 뷰 동적 생성
    func initScrollView(){
        promiseScrollView.initial(view: view, width: viewModel.numOfPromiseCardList * 172 + 16, cardList: viewModel.promiseCardList)
    }
}

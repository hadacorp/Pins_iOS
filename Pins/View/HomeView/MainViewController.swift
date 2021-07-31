import UIKit
import SnapKit
import Foundation

class MainViewController: UIViewController {
    
    // MARK:- @IBOutlet Properties
    // 메인 뷰 배너 아울렛
    @IBOutlet weak var parentView: UIScrollView!
    @IBOutlet weak var mainViewBanner: UICollectionView!
    // MARK:- Public Properties
    // 뷰 모델 초기화
    public let viewModel = MainViewModel()
    // 메인 뷰 배너 width
    public var bannerWidth = UIScreen.main.bounds.width;
    // 메인 뷰 배너 페이지 카운트
    public var nowPage: Int = 0
    // 메인 뷰 참가한 카드 스크롤 뷰
    public let scrollView = UIScrollView()
    // 참가 신청한 핀 extension에서 방향 정해주기
    public var vector = 0
    // 참가 신청한 배너 페이지 카운트
    public var joinPage: Int = 0
    
    // MARK:- Private Views
    // 메인 뷰 약속 스크롤 뷰
    private let promiseScrollView = PromiseScrollView()
    // 메인 뷰 배너 컨트롤 버튼
    private let bannerCtrlBtnView = BannerCtrlBtnView()
    // 메인 뷰 참가한 카드 컨텐츠
    private let joinScrollView = JoinScrollView()
    // MARK:- Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // 배너 자동 스크롤 타이머 적용
        initBannerCollectionView()
        // 배너 컨트롤 버튼 init 적용
        initBannerCtrlBtnList()
        // 약속 스크롤 뷰 init 적용
        initCardScrollView()
        // 참가 신청 스크롤 뷰 init 적용
        initJoinScrollView()
        
    }
    
    // MARK:- Banner func
    // 배너 init
    func initBannerCollectionView(){
        // 델리게이트와 데이터 소스를 어디서 처리할 것인지 작성
        mainViewBanner.delegate = self
        mainViewBanner.dataSource = self
        parentView.addSubview(mainViewBanner)
        bannerTimer()
    }
    
    // 배너 컨트롤 버튼 init
    func initBannerCtrlBtnList(){
        bannerCtrlBtnView.initial(parent: self.view, list: viewModel.bannerCtrlBtnList, anchor: mainViewBanner)
    }
    
    // MARK:- Promise func
    // 약속 카드 스크롤 뷰 동적 생성
    func initCardScrollView(){
        promiseScrollView.initial(view: self.parentView, parent: mainViewBanner, width: viewModel.numOfPromiseCardList * 172 + 16, cardList: viewModel.promiseCardList)
    }
    
    // MARK:- Join func
    func initJoinScrollView(){
        scrollView.delegate = self
        let width = view.frame.width - 32
        print(width)
        joinScrollView.initial(scrollView: scrollView, parent: self.parentView, constraint: promiseScrollView.scrollView, width: viewModel.numOfJoinCardList * Int(width) + 8 * (viewModel.numOfJoinCardList - 1) + 32, cardList: viewModel.joinCardList)
    }
}

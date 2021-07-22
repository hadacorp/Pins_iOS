import UIKit

class MainViewController: UIViewController {

    // MARK:- @IBOutlet Properties
    // 메인 뷰 배너 아울렛
    @IBOutlet weak var mainViewBanner: UICollectionView!
    
    // MARK:- Private Properties
    // 뷰 모델 초기화
    private let viewModel = MainViewModel()
    // 메인 뷰 배너 페이지 카운트
    private var nowPage: Int = 0
    
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
    }
    
    // MARK:- Banner func
    // 배너 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 4.5, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    // 배너 움직이는 매서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if nowPage == viewModel.numOfBannerImageList - 1 {
        // 맨 처음 페이지로 돌아감
            mainViewBanner.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            // 스크롤로 변경했을 때 버튼 변경
            changeBannerCtrlBtnColor()
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        // 스크롤로 변경했을 때 버튼 변경
        changeBannerCtrlBtnColor()
        mainViewBanner.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    // 배너 컨트롤 버튼 init
    func initBannerCtrlBtnList(){
        // 현재 뷰에 생성해논 배열들 추가
        for btn in viewModel.bannerCtrlBtnList {
            self.view.addSubview(btn.button)
        }
    }
    func changeBannerCtrlBtnColor(){
        // nowPage를 받아와 해당 인덱스 버튼 background opacity 1
        viewModel.changeBannerCtrlBtnBgColor(cur: nowPage)
    }
}

// MARK:- Extensions
// MARK:- CollectionView Setting
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBannerImageList
    }
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainViewBanner.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        cell.imageView.image = viewModel.bannerImageList[indexPath.row].image
        
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: mainViewBanner.frame.width, height: mainViewBanner.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        // 스크롤로 변경했을 때 버튼 변경
        changeBannerCtrlBtnColor()
    }
}

import UIKit

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
        var i = 0
        for btn in viewModel.bannerCtrlBtnList {
            self.view.addSubview(btn.button)
            // constraint 적용하기 위해
            btn.button.translatesAutoresizingMaskIntoConstraints = false
            btn.button.bottomAnchor.constraint(equalTo: mainViewBanner.bottomAnchor, constant: -8).isActive = true
            
            // leading으로 갈 값
            let leadingMinus = (CGFloat(13 * viewModel.numOfBannerBtnList) + CGFloat(8 * CGFloat(viewModel.numOfBannerBtnList - 1))) / 2
            // 시작될 중심 값
            let positionX = (view.frame.width / 2) + CGFloat(21 * i)
            
            btn.button.leadingAnchor.constraint(equalTo: mainViewBanner.leadingAnchor, constant:
                                                    (positionX - leadingMinus)).isActive = true
            i += 1
            btn.button.heightAnchor.constraint(equalToConstant: 8).isActive = true
            btn.button.widthAnchor.constraint(equalToConstant: 13).isActive = true
        }
    }
    func changeBannerCtrlBtnColor(){
        // nowPage를 받아와 해당 인덱스 버튼 background opacity 1
        viewModel.changeBannerCtrlBtnBgColor(cur: nowPage)
    }
    
    // MARK:- ScrollView func
    func initScrollView(){
        scrollView = UIScrollView()
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: mainViewBanner.bottomAnchor, constant: 48).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 256).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        
        scrollView.contentSize = CGSize(width: viewModel.numOfPromiseCardList * 172 + 16, height: 224)
        scrollView.showsHorizontalScrollIndicator = false
    }
    // MARK:- Promise func
    func initPromiseCardList(){
        var i = 0
        for card in viewModel.promiseCardList {
            let background = UIView()
            background.addSubview(card.simbolPin)
            background.addSubview(card.tag)
            background.addSubview(card.thumbnail)
            background.addSubview(card.title)
            background.addSubview(card.time)
            
            initPromiseCardThumbnail(card: card, background: background)
            initPromiseCardTag(card: card, background: background)
            initPromiseCardTitle(card: card, background: background)
            
            scrollView.addSubview(background)
            background.translatesAutoresizingMaskIntoConstraints = false
            background.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(16 + (172 * i))).isActive = true
            background.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8).isActive = true
            background.widthAnchor.constraint(equalToConstant: 164).isActive = true
            background.heightAnchor.constraint(equalToConstant: 224).isActive = true
            background.frame = CGRect(x: 0, y: 0, width: 164, height: 224)
            background.backgroundColor = .white
            background.layer.cornerRadius = 8
            background.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), alpha: 0.08, x: 0, y: 8, blur: 16, spread: 0)
            i += 1
        }
    }
    func initPromiseCardTitle(card: PromiseCardModel, background: UIView){
        card.title.translatesAutoresizingMaskIntoConstraints = false
        card.title.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
        card.title.topAnchor.constraint(equalTo: background.topAnchor, constant: 99).isActive = true
        card.title.widthAnchor.constraint(equalToConstant: 148).isActive = true
        card.title.heightAnchor.constraint(equalToConstant: 60).isActive = true
        card.title.textColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        card.title.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        card.title.textAlignment = .center
        card.title.numberOfLines = 2
    }
    
    // 약속 카드 썸네일 초기화
    func initPromiseCardThumbnail(card: PromiseCardModel, background: UIView){
        card.thumbnail.layer.cornerRadius = 30
        card.thumbnail.clipsToBounds = true
        
        card.thumbnail.translatesAutoresizingMaskIntoConstraints = false
        card.thumbnail.heightAnchor.constraint(equalToConstant: 60).isActive = true
        card.thumbnail.widthAnchor.constraint(equalToConstant: 60).isActive = true
        card.thumbnail.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
        card.thumbnail.topAnchor.constraint(equalTo: background.topAnchor, constant: 31).isActive = true
    }
    // 약속 카드 태그 초기화
    func initPromiseCardTag(card: PromiseCardModel, background: UIView){
        card.tag.translatesAutoresizingMaskIntoConstraints = false
        card.tag.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 30).isActive = true
        card.tag.topAnchor.constraint(equalTo: background.topAnchor, constant: 6).isActive = true
        card.tag.textColor = #colorLiteral(red: 0.0431372549, green: 0.6392156863, blue: 0.8705882353, alpha: 1)
        card.tag.font = UIFont(name: "NotoSansKR-Regular", size: 13)
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
// MARK:- Shadow
extension CALayer {
  func applySketchShadow(
    color: UIColor = .black,
    alpha: Float = 0.5,
    x: CGFloat = 0,
    y: CGFloat = 2,
    blur: CGFloat = 4,
    spread: CGFloat = 0)
  {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}

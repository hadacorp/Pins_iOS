import UIKit

class MainViewController: UIViewController {

    // 메인 뷰 배너 아울렛
    @IBOutlet weak var mainViewBanner: UICollectionView!
    // 배너 이미지 목록 리스트
    var bannerImageArray = [
        UIImage(named: "mainBanner"),
        UIImage(named: "mainBanner"),
        UIImage(named: "mainBanner"),
        UIImage(named: "mainBanner"),
        UIImage(named: "mainBanner"),
        UIImage(named: "mainBanner")
    ]
    // 메인 뷰 배너 페이지 카운트
    var nowPage: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 델리게이트와 데이터 소스를 어디서 처리할 것인지 작성
        mainViewBanner.delegate = self
        mainViewBanner.dataSource = self
        
        bannerTimer()
    }
    
    // 배너 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    // 배너 움직이는 매서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if nowPage == bannerImageArray.count-1 {
        // 맨 처음 페이지로 돌아감
            mainViewBanner.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        mainViewBanner.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImageArray.count
    }
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainViewBanner.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        cell.imageView.image = bannerImageArray[indexPath.row]
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: mainViewBanner.frame.size.width, height:  mainViewBanner.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}


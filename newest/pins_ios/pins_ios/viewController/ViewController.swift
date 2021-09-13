//
//  ViewController.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/08.
//  Apply Library SnapKit,
//

import UIKit
import MapKit
import SnapKit

class ViewController: UIViewController{
    // MARK:- IBOutlet variable
    // Main MapView
    @IBOutlet weak var mainMap: MKMapView!
    // MARK:- Public variable
    public var viewModel = MainViewModel(parent: nil, layout: nil)
    // 위치를 받아오기 위한 locationManager
    public var locationManager = CLLocationManager()
    // 맵에 찍을 핀 객체
    public var pinAnnotation: [CustomPintAnnotation] = []
    
    // 현재 위치 저장
    public var currentLocation: CLLocation!
    // API
    public var getKeywordPinAPI = GetKeywordPinAPI()
    // 이동할 좌표
    public var paramLatitude: CLLocationDegrees?
    public var paramLongitude: CLLocationDegrees?
    // 하단 컬렉션 뷰
    public var collectionView: UICollectionView!
    public var currentIndex: CGFloat = 0.0
    // 핀 관련 변수
    public var tempArr: [Int] = []
    
    
    // MARK:- Private function
    override func viewDidLoad() {
        super.viewDidLoad()
        // navigation 뒤로가기 스와이프 예외처리
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        // 처음 권환 체크
        setPermission()
        // viewModel 생성
        viewModel = MainViewModel(parent: self.view, layout: self.view.safeAreaLayoutGuide)
        // 시작시 지도 설정 세팅
        firstMapInit()
        // 버튼 이벤트 세팅
        setButtonEvent()
        // 그라데이션
        setGradation()
        // collection 세팅
        setCollectionView()
    }

    override func viewWillAppear(_ animated: Bool) {
        if let latitude = paramLatitude {
            if let longitude = paramLongitude {
                // 검색된 위치로 이동
                goLocation(latitudeValue: latitude, longtudeValue: longitude, delta: 500)
                // 주변 핀들 받아오기
                GetKeywordPinAPI().requestGet(latitude: latitude, longitude: longitude) { (success, data) in
                    if let data = data as? [Pin] {
                        self.viewModel.setCheckablePins(checkablePins: data)
                        DispatchQueue.main.async {
                            self.mainMap.removeAnnotations(self.mainMap.annotations)
                            self.collectionView.reloadData()
                            self.initPins()
                            self.collectionView.contentOffset = CGPoint(x: 0, y: 0)
                            self.currentIndex = 0
                        }
                    }
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if viewModel.getPinCardsCount() > 0 {
            self.upCardView()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        downCardView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        downCardView()
    }
    
    private func setCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 110)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: "CarouselCell")
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.showsHorizontalScrollIndicator = false
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { view in
            view.width.equalTo(UIScreen.main.bounds.width)
            view.height.equalTo(140)
            view.bottom.equalTo(self.view.safeAreaInsets).offset(150)
            view.leading.equalTo(0)
            view.trailing.equalTo(0)
        }
    }
    
    private func setGradation(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: view.frame.maxY - 60, width: view.frame.width, height: 60)
        
        let colors: [CGColor] = [
            #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0),
            #colorLiteral(red: 0.9725490196, green: 0.9607843137, blue: 0.9294117647, alpha: 1)
        ]
        gradientLayer.colors = colors
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        view.layer.addSublayer(gradientLayer)
    }
    
    private func setPermission(){
        // 위치매니저 델리게이트 설정
        locationManager.delegate = self
        // 거리 정확도 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 사용자에게 허용 받기 alert 띄우기
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            print("위치 서비스 On 상태")
            // 위치 정보 받아오기 시작
            locationManager.startUpdatingLocation()
        } else {
            print("위치 서비스 Off 상태")
        }
    }
    
    private func firstMapInit(){
        mainMap.delegate = self
        
        // 맵에 보여줄 카테고리 설정
        mainMap.pointOfInterestFilter = .some(MKPointOfInterestFilter(including:[.cafe, .restaurant, .airport, .beach, .hospital, .movieTheater, .nationalPark,
                                                                                 .park, .publicTransport, .school, .university, .theater, .foodMarket]))
                                                                        
        // user 위치 보기
        mainMap.showsUserLocation = true
        currentLocation = locationManager.location
        // 현재 위치로 이동
        if let currentLocation = currentLocation {
            goLocation(latitudeValue: currentLocation.coordinate.latitude, longtudeValue: currentLocation.coordinate.longitude, delta: 250)
        }
        
        mainMap.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
    }
    
    // MARK:- Init Pins
    private func initPins(){
        if let pins = viewModel.getCheckablePins() {
            for pin in 0 ..< pins.count{
                pinAnnotation.append(CustomPintAnnotation())
                pinAnnotation[pin].pinType = pins[pin].pinType
                pinAnnotation[pin].pinCategory = pins[pin].category
                pinAnnotation[pin].coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(pins[pin].latitude!), longitude: CLLocationDegrees(pins[pin].longitude!))
                pinAnnotation[pin].title = pins[pin].category
                pinAnnotation[pin].subtitle = "\(pin)"
                mainMap.addAnnotation(pinAnnotation[pin])
            }
        }
    }
}


// MARK:- Extension CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate{
    func getLocationUsagePermission() {
        //location4
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("GPS 권한 설정됨")
            firstMapInit()
        case .restricted, .notDetermined:
            print("GPS 권한 설정되지 않음")
            getLocationUsagePermission()
        case .denied:
            print("GPS 권한 요청 거부됨")
            getLocationUsagePermission()
        default:
            print("GPS: Default")
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
// MARK:- Extension MKMapViewDelegate
extension ViewController: MKMapViewDelegate{
    // 이름에 맞는 이미지로 핀 이미지를 변경해주기
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else{
            return nil
        }
        var annotationView = mainMap.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            // Create the view
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        }
        else{
            annotationView?.annotation = annotation
        }
        if (annotationView?.subviews.count)! < 1 {
            viewModel.makePins(parent: annotationView!, type: pinAnnotation[Int(annotation.subtitle!!)!].pinType, category: pinAnnotation[Int(annotation.subtitle!!)!].pinCategory)
        }
        else{
            for view in annotationView!.subviews {
                view.removeFromSuperview()
            }
            viewModel.makePins(parent: annotationView!, type: pinAnnotation[Int(annotation.subtitle!!)!].pinType, category: pinAnnotation[Int(annotation.subtitle!!)!].pinCategory)
        }
        return annotationView
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getPinCardsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCell", for: indexPath) as? CarouselCell {
            for v in myCell.subviews{
                v.removeFromSuperview()
            }
            myCell.setupCell(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            if let pins = viewModel.getCheckablePins(){
                let pin = PinCard()
                let pinsData = pins[indexPath.row]
                pin.initTag(parent: myCell, type: PinType.init(rawValue: pinsData.pinType!)!)
                pin.initCategory(parent: myCell, string: pinsData.category!, type: PinType.init(rawValue: pinsData.pinType!)!)
                pin.initImage(parent: myCell, type: PinType.init(rawValue: pinsData.pinType!)!, urlString: pinsData.image)
                pin.initContent(parent: myCell, type: PinType.init(rawValue: pinsData.pinType!)!, string: pinsData.title)
                pin.initBottom(parent: myCell, type: PinType.init(rawValue: pinsData.pinType!)!, string: pinsData.date, like: pinsData.like, comment: pinsData.comment)
            }
            return myCell
        }
        fatalError("Unable to dequeue subclassed cell")
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        var roundedIndex = round(index)
        
        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
            roundedIndex = floor(index)
        }
        else if scrollView.contentOffset.x < targetContentOffset.pointee.x {
            roundedIndex = ceil(index)
        }
        else {
            roundedIndex = round(index)
        }
        
        if currentIndex > roundedIndex {
            currentIndex -= 1
            roundedIndex = currentIndex
        }
        else if currentIndex < roundedIndex {
            currentIndex += 1
            roundedIndex = currentIndex
        }
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        
        targetContentOffset.pointee = offset
    }
}

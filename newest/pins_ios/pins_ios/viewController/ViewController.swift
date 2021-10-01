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
    // MARK: -IBOutlet variable
    // Main MapView
    @IBOutlet weak var mainMap: MKMapView!
    // MARK: -Public variable
    public var viewModel = MainViewModel(parent: nil, layout: nil)
    // 위치를 받아오기 위한 locationManager
    public var locationManager = CLLocationManager()
    // 맵에 찍을 핀 객체
    public var pinAnnotation: [Int : CustomPintAnnotation] = [:]
    // 현재 위치 저장
    public var currentLocation: CLLocation!
    // 하단 컬렉션 뷰
    public var collectionView: UICollectionView!
    public var currentIndex: CGFloat = 0.0
    public var goIndex: Double = 0
    
    // Param Values 이동할 좌표
    public var paramLatitude: CLLocationDegrees?
    public var paramLongitude: CLLocationDegrees?
    public var paramSearchText: String? = nil
    // 0: 키워드, 1: 위치
    public var paramType: Int = 0
    // toast
    public var toastLabel: UILabel?
    
    // 맵 일정 거리 스크롤 시 fetch를 위한 시작 좌표 저장
    public var startPos: CLLocationCoordinate2D?
    // 포커스된 핀
    public var focusPin: MKAnnotationView?
    // MARK: - Private variable
    
    // MARK: - Private function
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
                // 위치 검색
                if paramType == 1{
                    // 주변 핀들 받아오기
                    GetLocation().requestGet(latitude: latitude, longitude: longitude) { (success, data) in
                        if let data = data as? [Pin] {
                            self.viewModel.setCheckablePins(checkablePins: data)
                            DispatchQueue.main.async { [self] in
                                mainMap.removeAnnotations(mainMap.annotations)
                                initPins(pins: self.viewModel.getCheckablePins()!)
                                currentIndex = 0
                                // 검색된 위치로 이동
                                startPos = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                goLocation(latitudeValue: latitude, longtudeValue: longitude, delta: 500)
                            }
                        }
                    }
                }
                // 키워드 검색
                else if paramType == 0 {
                    GetKeyword().requestGet(keyword: paramSearchText!, latitude: latitude, longitude: longitude) { (success, data) in
                        if let data = data as? [Pin] {
                            self.viewModel.setCheckablePins(checkablePins: data)
                            DispatchQueue.main.async { [self] in
                                mainMap.removeAnnotations(self.mainMap.annotations)
                                initPins(pins: self.viewModel.getCheckablePins()!)
                                currentIndex = 0
                                // 검색된 위치로 이동
                                startPos = CLLocationCoordinate2D(latitude: viewModel.getPinsIndex(index: 0).latitude!, longitude: viewModel.getPinsIndex(index: 0).longitude!)
                                goLocation(latitudeValue: viewModel.getPinsIndex(index: 0).latitude!, longtudeValue: viewModel.getPinsIndex(index: 0).longitude!, delta: 500)
                                
                                let pivot = CLLocation(latitude: viewModel.getPinsIndex(index: 0).latitude!, longitude: viewModel.getPinsIndex(index: 0).longitude!)
                                viewModel.setCheckablePins(checkablePins: viewModel.mergeSort(viewModel.getCheckablePins()!, pivot: pivot))
                                mainMap.selectAnnotation(pinAnnotation[viewModel.getPinsIndex(index: Int(currentIndex)).pinDBId!]!, animated: false)
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // 키워드 검색일때
        if viewModel.getPinCardsCount() > 0 && paramType == 0{
            self.upCardView()
            if let paramSearchText = paramSearchText {
                searchedKeywordWide(keyword: paramSearchText)
            }
            else{
                // 검색창 원래대로
                searchedKeywordNarrow()
            }
        }
        // 키워드 검색인데 값이 없으면
        else if viewModel.getPinCardsCount() == 0 {
            showToast(message: "없어요 야발.", font: UIFont(name: "NotoSansKR-Regular", size: 14)!, parent: self.view)
        }
        // 위치 검색일때
        else{
            // 검색창 원래대로
            searchedKeywordNarrow()
            downCardView()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        downCardView()
        mainMap.deselectAnnotation(focusPin?.annotation, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        downCardView()
        mainMap.deselectAnnotation(focusPin?.annotation, animated: true)
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
        startPos = CLLocationCoordinate2D(latitude: mainMap.centerCoordinate.latitude, longitude: mainMap.centerCoordinate.longitude)
    }
    
    public func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0), parent: UIView){
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 130, height: 30))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 15;
        toastLabel.clipsToBounds = true
        parent.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 1.0, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {
            (isCompleted) in toastLabel.removeFromSuperview()
        })
    }
    
    // MARK: - Init Pins
    public func initPins(pins: [Pin]){
        for pin in 0 ..< pins.count{
            pinAnnotation.updateValue(CustomPintAnnotation(), forKey: pins[pin].pinDBId!)
            pinAnnotation[pins[pin].pinDBId!]!.pinType = pins[pin].pinType
            pinAnnotation[pins[pin].pinDBId!]!.pinDBId = pins[pin].pinDBId
            pinAnnotation[pins[pin].pinDBId!]!.pinCategory = pins[pin].category
            pinAnnotation[pins[pin].pinDBId!]!.pinTitle = pins[pin].title ?? ""
            pinAnnotation[pins[pin].pinDBId!]!.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(pins[pin].latitude!), longitude: CLLocationDegrees(pins[pin].longitude!))
            pinAnnotation[pins[pin].pinDBId!]!.title = pins[pin].category
            pinAnnotation[pins[pin].pinDBId!]!.subtitle = "\(pins[pin].pinDBId!)"
            mainMap.addAnnotation(pinAnnotation[pins[pin].pinDBId!]!)
        }
    }
    
}


// MARK: - Extension CLLocationManagerDelegate
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
// MARK: - Extension MKMapViewDelegate
extension ViewController: MKMapViewDelegate{
    // 이름에 맞는 이미지로 핀 이미지를 변경해주기
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else{
            return nil
        }
        var annotationView = mainMap.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
        annotationView?.canShowCallout = false
    
        if (annotationView?.subviews.count)! < 1 {
            // 핀 생성
            viewModel.makePin(pinAnnotation: pinAnnotation, annotationView: annotationView!, annotation: annotation)
        }
        else{
            // 핀 생성
            for view in annotationView!.subviews {
                view.removeFromSuperview()
            }
            viewModel.makePin(pinAnnotation: pinAnnotation, annotationView: annotationView!, annotation: annotation)
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        if let startPos = startPos{
            if mapView.centerCoordinate.distance(from: startPos) > 1500 && paramSearchText == "" {
                GetLocation().requestGet(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude) { [self] (success, data) in
                    if let data = data as? [Pin] {
                        let tempsetA = Set(data.map{ $0 })
                        let tempsetB = Set(viewModel.getCheckablePins()!.map{ $0 })
                        // 새로 만들어야 하는 것
                        let resulta = tempsetA.subtracting(tempsetB)
                        // 삭제 해야하는 것
                        let resultc = tempsetB.subtracting(tempsetA)
                        
                        viewModel.setCheckablePins(checkablePins: tempsetA.map({ $0 }))
                        DispatchQueue.main.async {
                            // 삭제해야하는 핀 삭제
                            for i in resultc{
                                for j in mainMap.annotations{
                                    if i.pinDBId?.description == j.subtitle{
                                        mainMap.removeAnnotation(j)
                                    }
                                }
                            }
                            // 생성해야하는 핀 생성
                            let pins = resulta.map{ $0 }
                            initPins(pins: pins)
                            
                            currentIndex = 0
                            self.startPos = CLLocationCoordinate2D(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
                        }
                    }
                }
            }
            else if mapView.centerCoordinate.distance(from: startPos) > 1500 && paramSearchText != ""{
                GetKeyword().requestGet(keyword: paramSearchText!, latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude) { [self] (success, data) in
                    if let data = data as? [Pin] {
                        let tempsetA = Set(data.map{ $0 })
                        let tempsetB = Set(viewModel.getCheckablePins()!.map{ $0 })
                        // 새로 만들어야 하는 것
                        let resulta = tempsetA.subtracting(tempsetB)
                        // 삭제 해야하는 것
                        let resultc = tempsetB.subtracting(tempsetA)
                        
                        viewModel.setCheckablePins(checkablePins: tempsetA.map({ $0 }))
                        DispatchQueue.main.async {
                            // 삭제해야하는 핀 삭제
                            for i in resultc{
                                for j in mainMap.annotations{
                                    if i.pinDBId?.description == j.subtitle{
                                        mainMap.removeAnnotation(j)
                                    }
                                }
                            }
                            // 생성해야하는 핀 생성
                            let pins = resulta.map{ $0 }
                            initPins(pins: pins)
                            
                            currentIndex = 0
                            self.startPos = CLLocationCoordinate2D(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
                        }
                    }
                }
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // 핀 클릭 시 카드뷰 띄워주기
        // 스크롤이 안됐는데 클릭이 됐으면
        if currentIndex == goIndex{
            let pivot = CLLocation(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)
            viewModel.setCheckablePins(checkablePins: viewModel.mergeSort(viewModel.getCheckablePins()!, pivot: pivot))
            currentIndex = 0
            collectionView.contentOffset = CGPoint(x: 0, y: 0)
            collectionView.reloadData()
        }
        upCardView()
        viewModel.focusPin(pinAnnotation: pinAnnotation, annotationView: view, annotation: view.annotation!)
        focusPin = view
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        viewModel.unfocusPin(pinAnnotation: pinAnnotation, annotationView: view, annotation: view.annotation!)
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
            myCell.setupCell(color: UIColor.white)
            if let pins = viewModel.getCheckablePins(){
                let pin = PinCard()
                let pinsData = pins[indexPath.row]
                pin.initial(parent: myCell, type: PinType.init(rawValue: pinsData.pinType!)!, category: pinsData.category!, content: pinsData.title!, urlString: pinsData.image, bottom: pinsData.date, like: pinsData.like, comment: pinsData.comment)
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
        goIndex = currentIndex
        
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
        
        mainMap.selectAnnotation(pinAnnotation[viewModel.getPinsIndex(index: Int(currentIndex)).pinDBId!]!, animated: false)
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}

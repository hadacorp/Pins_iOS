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
    public var pinAnnotation: CustomPintAnnotation!
    
    // 삭제할 테스트용 변수들
    public var array: [CustomPintAnnotation] = []
    public var count = 0
    
    // 현재 위치 저장
    public var currentLocation: CLLocation!
    // API
    public var getKeywordPinAPI = GetKeywordPinAPI()
    // 이동할 좌표
    public var paramLatitude: CLLocationDegrees?
    public var paramLongitude: CLLocationDegrees?
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let latitude = paramLatitude {
            if let longitude = paramLongitude {
                goLocation(latitudeValue: latitude, longtudeValue: longitude, delta: 500)
            }
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
        mainMap.pointOfInterestFilter = .some(MKPointOfInterestFilter(including: [MKPointOfInterestCategory.cafe, MKPointOfInterestCategory.restaurant]))
        // user 위치 보기
        mainMap.showsUserLocation = true
        currentLocation = locationManager.location
        // 현재 위치로 이동
        if let currentLocation = currentLocation {
            goLocation(latitudeValue: currentLocation.coordinate.latitude, longtudeValue: currentLocation.coordinate.longitude, delta: 250)
        }
        
        mainMap.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
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
        
        let customPointAnnotation = annotation as! CustomPintAnnotation
        annotationView?.image = UIImage(named: customPointAnnotation.pinCustomImageName)
        
        return annotationView
    }
}
extension UIView{
    func setGradient(color1:UIColor,color2:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}

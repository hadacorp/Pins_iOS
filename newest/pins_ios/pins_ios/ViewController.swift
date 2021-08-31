//
//  ViewController.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/08.
//  Apply Library SnapKit,
//

import UIKit
import MapKit

class ViewController: UIViewController {
    // MARK:- IBOutlet variable
    // Main MapView
    @IBOutlet weak var mainMap: MKMapView!
    // MARK:- Public variable
    public var viewModel = MainViewModel(parent: nil)
    // 위치를 받아오기 위한 locationManager
    public var locationManager = CLLocationManager()
    // 맵에 찍을 핀 객체
    public var pinAnnotation: CustomPintAnnotation!
    
    // 삭제할 테스트용 변수들
    public var array: [CustomPintAnnotation] = []
    public var count = 0
    
    // MARK:- Private function
    override func viewDidLoad() {
        super.viewDidLoad()
        // 처음 권환 체크
        setPermission()
        
        viewModel = MainViewModel(parent: self.view)
        // 라이트 모드로 고정
        self.overrideUserInterfaceStyle = .light
        // 시작시 지도 설정 세팅
        firstMapInit()
        // 버튼 이벤트 세팅
        setButtonEvent()
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
        // 현재 위치 저장
        var currentLocation: CLLocation!
        currentLocation = locationManager.location
        // 현재 위치로 이동
        goLocation(latitudeValue: currentLocation.coordinate.latitude, longtudeValue: currentLocation.coordinate.longitude, delta: 250)
    }
    
    
    // 위도와 경도, 스팬(영역 폭)을 입력받아 지도에 표시
    private func goLocation(latitudeValue: CLLocationDegrees,
                    longtudeValue: CLLocationDegrees,
                    delta span: Double) {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let viewRegion = MKCoordinateRegion(center: pLocation, latitudinalMeters: span, longitudinalMeters: span)
        
        mainMap.region = viewRegion
        
        let mapCamera = MKMapCamera()
        mapCamera.centerCoordinate = pLocation
        mapCamera.pitch = 45
        mapCamera.altitude = 500 // example altitude
        mapCamera.heading = 0
        
        // set the camera property
        mainMap.camera = mapCamera
    }
    
    // 버튼 이벤트 설정
    private func setButtonEvent(){
        viewModel.getMoveButton().addTarget(self, action: #selector(filterAnimate), for: .touchUpInside)
        viewModel.getAddButton().addTarget(self, action: #selector(createPinAtCenter), for: .touchUpInside)
        viewModel.getSearchButton().addTarget(self, action: #selector(onClickSearchBtn), for: .touchUpInside)
    }
}

// MARK:- Extension CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate{
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


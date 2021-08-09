//
//  ViewController.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/08.
//  Apply Library SnapKit,
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    // MARK:- IBOutlet variable
    // Main MapView
    @IBOutlet weak var mainMap: MKMapView!
    // MARK:- Private variable
    // 위치를 받아오기 위한 locationManager
    private var locationManager = CLLocationManager()
    private var mark = PinMaker(title: nil, subtitle: nil, coordinate: CLLocationCoordinate2D(latitude: 37, longitude: 126))
    // MARK:- Private function
    override func viewDidLoad() {
        super.viewDidLoad()
        // 라이트 모드로 고정
        self.overrideUserInterfaceStyle = .light
        view.insetsLayoutMarginsFromSafeArea = false
        
        mainMap.delegate = self
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
        // 맵에 보여줄 카테고리 설정
        mainMap.pointOfInterestFilter = .some(MKPointOfInterestFilter(including: [MKPointOfInterestCategory.cafe, MKPointOfInterestCategory.restaurant]))
        // user 위치 보기
        mainMap.showsUserLocation = true
        // UI 세팅
        settingUI()
    }
    
    private func settingUI(){
        let addButton = SmallRoundedBtn(frame: CGSize(width: 45, height: 45), radius: 15, color: #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), background: self.view)
        addButton.button.addTarget(self, action: #selector(createPinAtCenter), for: .touchUpInside)
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
    
    // MARK:- Objc function
    @objc
    func createPinAtCenter() {
        let mark = PinMaker(title: "우리집",
                            subtitle: "집이 최고야",
                            coordinate: CLLocationCoordinate2D(latitude: mainMap.centerCoordinate.latitude, longitude: mainMap.centerCoordinate.longitude))
        mainMap.addAnnotation(mark)
    }
}

// MARK:- Extension locationManager
extension ViewController{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            // 현재 위치 핀 하나 만들기
            mark = PinMaker(title: "우리집",
                            subtitle: "집이 최고야",
                            coordinate: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
        }
        if mainMap.annotations.count == 0{
            // 현재 위치 핀으로 찍기
            mainMap.addAnnotation(mark)
            // 현재 위치를 중심으로 맵을 이동하기
            goLocation(latitudeValue: mark.coordinate.latitude, longtudeValue: mark.coordinate.longitude, delta: 250)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


//
//  ViewController.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/08.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    // Main MapView
    @IBOutlet weak var mainMap: MKMapView!
    // 위치를 받아오기 위한 locationManager
    var locationManager = CLLocationManager()
    var mark = PinMaker(title: nil, subtitle: nil, coordinate: CLLocationCoordinate2D(latitude: 37, longitude: 126))
    var tileRenderer = MKOverlayRenderer()
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
    }
    
    
    // 위도와 경도, 스팬(영역 폭)을 입력받아 지도에 표시
    func goLocation(latitudeValue: CLLocationDegrees,
                    longtudeValue: CLLocationDegrees,
                    delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        mainMap.setRegion(pRegion, animated: true)
        return pLocation
    }
}

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
            mainMap.centerCoordinate = goLocation(latitudeValue: mainMap.userLocation.coordinate.latitude, longtudeValue: mainMap.userLocation.coordinate.longitude, delta: 0.01)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


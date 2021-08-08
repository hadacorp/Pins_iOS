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
        mainMap.pointOfInterestFilter = .some(MKPointOfInterestFilter(including: [MKPointOfInterestCategory.cafe, MKPointOfInterestCategory.restaurant]))
    }
}

extension ViewController{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            mark = PinMaker(title: "우리집",
                            subtitle: "집이 최고야",
                            coordinate: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
        }
        if mainMap.annotations.count == 0{
            mainMap.addAnnotation(mark)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


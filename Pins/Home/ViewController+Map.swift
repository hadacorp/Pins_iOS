//
//  ViewController+Map.swift
//  Pins
//
//  Created by judongseok on 2022/01/13.
//

import UIKit
import MapKit

extension ViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    // 유저 어노테이션 세팅
    func setMapUserLocation() {
        locationManager.delegate = self
        // Foreground에서만 위치 정보 추적
        locationManager.requestWhenInUseAuthorization()
        // 위치 정보 정확도 세팅, 정확할수록 베터리 소모
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 어느 정도 거리의 위치 변화가 생겼을 때 알림을 받을 것인지, 현재 디폴트 값
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        print(locationManager.location?.coordinate)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 맵뷰 세팅
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mapView.frame = CGRect(x: 0, y: 0, width: UIScreenSize.shared.width, height: UIScreenSize.shared.height)
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        // Or, if needed, we can position map in the center of the view
        mapView.center = view.center
        
        mapView.layer.zPosition = -1;
        self.view.addSubview(mapView)
    }
    
    // 위치 정보 권한 요청
    func getLocationUsagePermission() {
        self.locationManager.requestWhenInUseAuthorization()
    }

    // 위치정보 업데이트 후 델리게이트
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: 4000, longitudinalMeters: 4000)
        mapView.setRegion(region, animated: true)
    }
    
    // 권한 변경 시 델리게이트
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("GPS 권한 설정됨")
            self.mapView.showsUserLocation = true
            self.mapView.setUserTrackingMode(.follow, animated: true)
        case .restricted, .notDetermined:
            print("GPS 권한 설정되지 않음")
            DispatchQueue.main.async {
                self.getLocationUsagePermission()
            }
        case .denied:
            print("GPS 권한 요청 거부됨")
            DispatchQueue.main.async {
                self.getLocationUsagePermission()
            }
        default:
            print("GPS: Default")
        }
    }
}

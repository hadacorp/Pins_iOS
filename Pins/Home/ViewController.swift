//
//  ViewController.swift
//  Pins
//
//  Created by judongseok on 2022/01/12.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: BaseViewController {
    // MARK: - Property
    let locationManager: CLLocationManager = CLLocationManager()
    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // GPS 사용 허가 받기
        setMapUserLocation()
        getLocationUsagePermission()
    }
    
    override func setupUI() {
        // 위측 버튼 2개
        CustomButton(type: .small, parent: mapView)
            .setSize(width: 40, height: 40)
            .setupConstraints(top: 16 + UIScreenSize.shared.topPadding, leading: 16)
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        CustomButton(type: .small, parent: mapView)
            .setSize(width: 40, height: 40)
            .setupConstraints(top: 16 + UIScreenSize.shared.topPadding, leading: UIScreenSize.shared.width - 56)
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        // 하단 작은 버튼 2개
        CustomButton(type: .small, parent: mapView)
            .setSize(width: 40, height: 40)
            .setupConstraints(top: UIScreenSize.shared.safeHeight - 124 + UIScreenSize.shared.topPadding, leading: 16)
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        CustomButton(type: .small, parent: mapView)
            .setSize(width: 40, height: 40)
            .setupConstraints(top: UIScreenSize.shared.safeHeight - 124 + UIScreenSize.shared.topPadding, leading: UIScreenSize.shared.width - 56)
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        // 하단 중간 버튼 3개
        CustomButton(type: .middle, parent: mapView)
            .setSize(width: 50, height: 50)
            .setupConstraints(top: UIScreenSize.shared.safeHeight - 64 + UIScreenSize.shared.topPadding, leading: 16)
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        CustomButton(type: .middle, parent: mapView)
            .setSize(width: 50, height: 50)
            .setupConstraints(top: UIScreenSize.shared.safeHeight - 64 + UIScreenSize.shared.topPadding, leading: UIScreenSize.shared.width / 2 - 25)
            .setColor(color: UIColor(hex: "1059FF").cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        CustomButton(type: .middle, parent: mapView)
            .setSize(width: 50, height: 50)
            .setupConstraints(top: UIScreenSize.shared.safeHeight - 64 + UIScreenSize.shared.topPadding, leading: UIScreenSize.shared.width - 66)
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        // 상단 위치 정보 텍스트
        CustomLabel(parent: mapView)
            .setFont(name: "NotoSansKR-Bold", size: 18)
            .setColor(color: UIColor(hex: "999999"))
            .setCenterXConstraint(top: 22 + UIScreenSize.shared.topPadding, center: mapView)
            .setText(text: "인계동")
            .end()
    }
    
    // ex
    @objc func printLog() {
        // 위치 요청 시
        let accuracyState = CLLocationManager().accuracyAuthorization
        switch accuracyState {
        case .fullAccuracy:
            print("full")
        case .reducedAccuracy:
            print("reduce")
        @unknown default:
            print("Unknown")
        }
        print("button clicked!")
    }
}

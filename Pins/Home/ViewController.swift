//
//  ViewController.swift
//  Pins
//
//  Created by judongseok on 2022/01/12.
//

import UIKit
import MapKit
import RxSwift
import RxCocoa
import CoreLocation

class ViewController: BaseViewController {
    // MARK: - Property
    let locationManager: CLLocationManager = CLLocationManager()
    let mapView = MKMapView()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // GPS 사용 허가 받기
        setMapUserLocation()
    }
    
    override func setupUI() {
        // 위측 버튼 2개
        CustomButton(type: .small, parent: mapView)
            .setSize(width: 40, height: 40)
            .makeConstraints{
                $0.top.equalTo(16 + UIScreenSize.shared.topPadding)
                $0.leading.equalTo(16)
            }
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .setImage(image: UIImage(named: "search")!)
        
        CustomButton(type: .small, parent: mapView)
            .setSize(width: 40, height: 40)
            .makeConstraints{
                $0.top.equalTo(16 + UIScreenSize.shared.topPadding)
                $0.trailing.equalTo(-16)
            }
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .setImage(image: UIImage(named: "menu")!)
        
        // 하단 작은 버튼 2개
        CustomButton(type: .small, parent: mapView)
            .setSize(width: 40, height: 40)
            .makeConstraints{
                $0.bottom.equalTo(-84 - UIScreenSize.shared.bottomPadding)
                $0.leading.equalTo(16)
            }
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .setImage(image: UIImage(named: "refresh")!)
        
        CustomButton(type: .small, parent: mapView)
            .setSize(width: 40, height: 40)
            .makeConstraints{
                $0.bottom.equalTo(-84 - UIScreenSize.shared.bottomPadding)
                $0.trailing.equalTo(-16)
            }
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .setImage(image: UIImage(named: "location")!)
        
        // 하단 중간 버튼 3개
        CustomButton(type: .middle, parent: mapView)
            .setSize(width: 50, height: 50)
            .makeConstraints{
                $0.bottom.equalTo(-14 - UIScreenSize.shared.bottomPadding)
                $0.leading.equalTo(16)
            }
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .setImage(image: UIImage(named: "message")!)
        
        CustomButton(type: .middle, parent: mapView)
            .setSize(width: 50, height: 50)
            .makeConstraints{
                $0.bottom.equalTo(-14 - UIScreenSize.shared.bottomPadding)
                $0.centerX.equalTo(self.mapView)
            }
            .setColor(color: UIColor(hex: "1059FF").cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .setImage(image: UIImage(named: "plus")!)
        
        CustomButton(type: .middle, parent: mapView)
            .setSize(width: 50, height: 50)
            .makeConstraints{
                $0.bottom.equalTo(-14 - UIScreenSize.shared.bottomPadding)
                $0.trailing.equalTo(-16)
            }
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .setImage(image: UIImage(named: "community")!)
        
        // 상단 위치 정보 텍스트
        CustomLabel(parent: mapView)
            .setFont(name: "NotoSansKR-Bold", size: 18)
            .setColor(color: UIColor(hex: "999999"))
            .makeConstraints{
                $0.centerX.equalTo(self.mapView)
                $0.top.equalTo(22 + UIScreenSize.shared.topPadding)
            }
            .setText(text: "인계동")
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

// 전처리
#if DEBUG

import SwiftUI
@available(iOS 13.0, *)

// UIViewControllerRepresentable을 채택
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    // _ uiViewController: UIViewController로 지정
    func updateUIViewController(_ uiViewController: UIViewController , context: Context) {
        
    }
    // makeui
    func makeUIViewController(context: Context) -> UIViewController {
    // Preview를 보고자 하는 Viewcontroller 이름
    // e.g.)
        ViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    
    @available(iOS 13.0, *)
    static var previews: some View {
        // UIViewControllerRepresentable에 지정된 이름.
        ViewControllerRepresentable()
// 테스트 해보고자 하는 기기
            .previewDevice("iPhone 13 mini")
    }
}
#endif

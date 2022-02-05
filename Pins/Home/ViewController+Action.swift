//
//  ViewController+Action.swift
//  Pins
//
//  Created by judongseok on 2022/01/13.
//
import MapKit
import UIKit
import RxSwift
import RxCocoa

extension ViewController {
    // 버튼 이벤트 주입
    func setButtonAction() {
        getUserLocation()
        searchLocation()
    }
    
    // 검색 버튼
    @objc
    func searchLocation() {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC")
        vcName?.modalPresentationStyle = .fullScreen
        vcName?.modalTransitionStyle = .crossDissolve
        self.present(vcName!, animated: true, completion: nil)
    }
    
    // 내 위치로 가기
    @objc
    func getUserLocation() {
        self.mapView.showsUserLocation = true
        self.mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    func apiTest() {
        NetworkService().getHomePinAndCard { (response) in
            switch(response) {
            case .success(let personData):
                if let data = personData as? User {
                    print(data)
                }
            case .requestErr(let message):
                print("requestErr", message)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serveErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}

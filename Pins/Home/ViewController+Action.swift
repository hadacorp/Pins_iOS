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
    func searchLocation() {
        if let searchBtn = UIStorage.shared.getUI(id: "search") as? CustomButton {
            searchBtn.rx.tap.bind{ [weak self] in
                let vcName = self?.storyboard?.instantiateViewController(withIdentifier: "SearchVC")
                vcName?.modalPresentationStyle = .fullScreen
                vcName?.modalTransitionStyle = .crossDissolve
                self?.present(vcName!, animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        }
    }
    
    // 내 위치로 가기
    func getUserLocation() {
        if let userLocationBtn = UIStorage.shared.getUI(id: "userLocation") as? CustomButton {
            userLocationBtn.rx.tap
                .bind{ [weak self] in
                    self?.mapView.showsUserLocation = true
                    self?.mapView.setUserTrackingMode(.follow, animated: true)
                }
                .disposed(by: disposeBag)
        }
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

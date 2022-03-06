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
    // 검색 버튼
    @objc
    func searchLocation() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC") else {
            return
        }
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // 카드뷰 클릭 시
    func detailView(card: CardInfo) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CardDetailVC") as? CardDetailViewController else {
            return
        }
        vc.viewModel.card = card
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
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

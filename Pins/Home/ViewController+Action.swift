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
    // 카드뷰 클릭 시
    func detailView(card: CardInfo) {
        let vc = CardDetailViewController()
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
    
    // 상호작용 버튼
    func interactionBtnAction() {
        if interactionBackground.isHidden {
            interactionBackground.setHidden(hidden: false)
            interactionBtn.setOpacity(opacity: 0)
        }
        else {
            interactionBackground.setHidden(hidden: true)
            interactionBtn.setOpacity(opacity: 0.9)
        }
    }
    
    func rxSetup() {
        interactionBtn.rx.tap
            .subscribe(onNext: { [weak self] in self?.interactionBtnAction() })
            .disposed(by: disposeBag)
        
        interactionCancel.rx.tap
            .subscribe(onNext: { [weak self] in self?.interactionBtnAction() })
            .disposed(by: disposeBag)
    
        searchBtn.rx.tap
            .subscribe(onNext: { [weak self] in
                let searchVC = SearchViewController()
                print("asdf")
                self?.navigationController?.pushViewController(searchVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    func apiTest() {
        
    }
}

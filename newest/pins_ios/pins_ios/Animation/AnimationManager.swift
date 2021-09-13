//
//  AnimationManager.swift
//  pins_ios
//
//  Created by judongseok on 2021/08/29.
//

import UIKit
import MapKit

extension ViewController{
    // MARK:- Objc function
    func upCardView() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
            self.collectionView.snp.updateConstraints { view in
                view.bottom.equalTo(self.view.safeAreaInsets).offset(-103)
            }
            self.collectionView.superview?.layoutIfNeeded()
            self.viewModel.getMyLocationButton().snp.updateConstraints { btn in
                btn.bottom.equalTo(-248)
            }
            self.viewModel.getMyLocationButton().superview?.layoutIfNeeded()
        }
    }
    
    func downCardView() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
            self.collectionView.snp.updateConstraints { view in
                view.bottom.equalTo(self.view.safeAreaInsets).offset(150)
            }
            self.collectionView.superview?.layoutIfNeeded()
            self.viewModel.getMyLocationButton().snp.updateConstraints { btn in
                btn.bottom.equalTo(-118)
            }
            self.viewModel.getMyLocationButton().superview?.layoutIfNeeded()
        }
    }
    
    @objc func myLocation() {
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 200, longitudinalMeters: 200)
            mainMap.setRegion(viewRegion, animated: true)
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) { [self] in
                let mapCamera = MKMapCamera()
                mapCamera.centerCoordinate = userLocation
                mapCamera.pitch = 45
                mapCamera.altitude = 500 // example altitude
                mapCamera.heading = 0
                print(mapCamera.centerCoordinate)
                // set the camera property
                mainMap.camera = mapCamera
            }
        }
    }
    
    @objc func filterAnimate(){
        if viewModel.getMoveButton().frame.width == 232 {
            viewModel.getMoveButton().setImage(#imageLiteral(resourceName: "iconEye"), for: .normal)
            
            viewModel.getFilterMeetButton().layer.opacity = 0
            viewModel.getFilterStoryButton().layer.opacity = 0
            viewModel.getFilterCommunityButton().layer.opacity = 0
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) { [self] in
                viewModel.getMoveButton().imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                viewModel.getMoveButton().snp.updateConstraints { btn in
                    btn.width.equalTo(40)
                    btn.height.equalTo(40)
                    btn.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
                    btn.trailing.equalTo(-16)
                }
                viewModel.getMoveButton().superview?.layoutIfNeeded()
            }
        }
        else if viewModel.getMoveButton().frame.width == 40{
            viewModel.getMoveButton().setImage(#imageLiteral(resourceName: "iconList"), for: .normal)
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) { [self] in
                viewModel.getMoveButton().imageEdgeInsets = UIEdgeInsets(top: 0, left: 202, bottom: 0, right: 10)
                viewModel.getMoveButton().snp.updateConstraints { btn in
                    btn.width.equalTo(232)
                    btn.height.equalTo(40)
                    btn.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
                    btn.trailing.equalTo(-16)
                }
                viewModel.getMoveButton().superview?.layoutIfNeeded()
                
            } completion: { [self] (finished: Bool) in
                viewModel.getFilterMeetButton().layer.opacity = 1
                viewModel.getFilterStoryButton().layer.opacity = 1
                viewModel.getFilterCommunityButton().layer.opacity = 1
            }
        }
    }
    
    
    @objc func onClickSearchBtn(){
        if viewModel.getSearchButton().frame.width == 40{
            
            viewModel.setSearchBackgroundDown()
            // 뒷배경 뷰 생성 후 내려오게 하기
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) { [self] in
                viewModel.getSearchButton().imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width - 72)
                viewModel.getSearchButton().snp.updateConstraints { btn in
                    btn.leading.equalTo(16)
                    btn.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
                    btn.height.equalTo(40)
                    btn.width.equalTo(UIScreen.main.bounds.width - 32)
                }
                viewModel.getSearchButton().superview?.layoutIfNeeded()
                
                
                viewModel.getSearchBackground().snp.updateConstraints { bg in
                    bg.top.equalTo(0)
                }
                viewModel.getSearchBackground().superview?.layoutIfNeeded()
            }
            // 맨 앞으로 가져오기
            self.view.bringSubviewToFront(self.viewModel.getSearchButton())
            viewModel.getSearchButton().setImage(#imageLiteral(resourceName: "iconBack"), for: .normal)
        }
        
        else{
            viewModel.setSearchBackgroundUp()
            
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) { [self] in viewModel.getSearchButton().imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                // 돋보기 버튼 애니메이션
                viewModel.getSearchButton().snp.updateConstraints { btn in
                    btn.leading.equalTo(16)
                    btn.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
                    btn.height.equalTo(40)
                    btn.width.equalTo(40)
                }
                viewModel.getSearchButton().superview?.layoutIfNeeded()
                
                // 뒷배경 애니메이션
                viewModel.getSearchBackground().snp.updateConstraints { bg in
                    bg.top.equalTo(-UIScreen.main.bounds.height)
                }
                viewModel.getSearchBackground().superview?.layoutIfNeeded()
            }
            viewModel.getSearchButton().setImage(#imageLiteral(resourceName: "icon"), for: .normal)
        }
    }
}

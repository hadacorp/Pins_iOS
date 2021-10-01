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
    // 카드뷰로 핀이 선택됐을 때
    
    func searchedKeywordNarrow(){
        for i in viewModel.getSearchButton().subviews {
            if i.tag != 1{
                i.removeFromSuperview()
            }
        }
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) { [self] in
            viewModel.getSearchButton().imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            viewModel.getSearchButton().snp.updateConstraints { btn in
                btn.width.equalTo(40)
                btn.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
                btn.leading.equalTo(16)
            }
            viewModel.getSearchButton().setImage(#imageLiteral(resourceName: "icon"), for: .normal)
            viewModel.getSearchButton().backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            viewModel.getSearchButton().superview?.layoutIfNeeded()
        }
        paramSearchText = ""
    }
    func searchedKeywordWide(keyword: String){
        for i in viewModel.getSearchButton().subviews {
            if i.tag != 1{
                i.removeFromSuperview()
            }
        }
        let keywordLabel = UILabel()
        let cancelButton = UIButton()
        keywordLabel.text = "'" + keyword + "'" + "로 검색됨"
        keywordLabel.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        keywordLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cancelButton.setImage(#imageLiteral(resourceName: "iconCancelWhite"), for: .normal)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) { [self] in
            viewModel.getSearchButton().imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: keywordLabel.intrinsicContentSize.width + 40)
            viewModel.getSearchButton().snp.updateConstraints { btn in
                btn.width.equalTo(keywordLabel.intrinsicContentSize.width + 80)
                btn.height.equalTo(40)
                btn.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
                btn.leading.equalTo(16)
            }
            viewModel.getSearchButton().setImage(#imageLiteral(resourceName: "iconMagnified"), for: .normal)
            viewModel.getSearchButton().backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
            viewModel.getSearchButton().superview?.layoutIfNeeded()
        } completion: { [self] (finished: Bool) in
            // 애니메이션 후
            viewModel.getSearchButton().addSubview(keywordLabel)
            keywordLabel.snp.makeConstraints { label in
                label.leading.equalTo(40)
                label.trailing.equalTo(40)
                label.top.equalTo(7)
                label.bottom.equalTo(-9)
            }
            
            viewModel.getSearchButton().addSubview(cancelButton)
            cancelButton.snp.makeConstraints { btn in
                btn.trailing.equalTo(0)
                btn.top.equalTo(0)
                btn.width.height.equalTo(40)
            }
        }
        
        cancelButton.addAction(UIAction(handler: { _ in
            self.searchedKeywordNarrow()
            self.downCardView()
        }), for: .touchUpInside)
    }
    func upCardView() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.collectionView.snp.updateConstraints { view in
                view.bottom.equalTo(self.view.safeAreaInsets).offset(-103)
            }
            self.collectionView.superview?.layoutIfNeeded()
            self.viewModel.getMyLocationButton().snp.updateConstraints { btn in
                btn.bottom.equalTo(-248)
            }
            self.viewModel.getRefreshButton().snp.updateConstraints { btn in
                btn.bottom.equalTo(-248)
            }
            self.viewModel.getMyLocationButton().superview?.layoutIfNeeded()
        }
    }
    
    func downCardView() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.collectionView.snp.updateConstraints { view in
                view.bottom.equalTo(self.view.safeAreaInsets).offset(150)
            }
            self.collectionView.superview?.layoutIfNeeded()
            self.viewModel.getMyLocationButton().snp.updateConstraints { btn in
                btn.bottom.equalTo(-118)
            }
            self.viewModel.getRefreshButton().snp.updateConstraints { btn in
                btn.bottom.equalTo(-118)
            }
            self.viewModel.getMyLocationButton().superview?.layoutIfNeeded()
        }
        
        currentIndex = 0
        goIndex = 0
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
            downCardView()
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
}

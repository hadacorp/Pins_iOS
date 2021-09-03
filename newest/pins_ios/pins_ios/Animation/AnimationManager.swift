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
    // 중앙에 핀 생성
    @objc
    func createPinAtCenter() {
        viewModel.AddCardView(radius: 20, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), parent: self.view)
        pinAnnotation = CustomPintAnnotation()
        pinAnnotation.pinCustomImageName = "iconLike"
        pinAnnotation.coordinate = CLLocationCoordinate2D(latitude: mainMap.centerCoordinate.latitude, longitude: mainMap.centerCoordinate.longitude)
        pinAnnotation.title = "우리집"
        pinAnnotation.subtitle = "집이 최고야"
        mainMap.addAnnotation(pinAnnotation)
        array.append(pinAnnotation)
    }
//    // 다음 핀으로 이동
//    func moveNextPin(){
//        if array.count > 0 {
//            self.mainMap.selectAnnotation(array[count % array.count], animated: true)
//            count += 1
//        }
//    }
    // 위도와 경도, 스팬(영역 폭)을 입력받아 지도에 표시
    @objc func goLocation(latitudeValue: CLLocationDegrees,
                    longtudeValue: CLLocationDegrees,
                    delta span: Double) {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let viewRegion = MKCoordinateRegion(center: pLocation, latitudinalMeters: span, longitudinalMeters: span)
        
        mainMap.region = viewRegion
        
        let mapCamera = MKMapCamera()
        mapCamera.centerCoordinate = pLocation
        mapCamera.pitch = 45
        mapCamera.altitude = 500 // example altitude
        mapCamera.heading = 0
        
        // set the camera property
        mainMap.camera = mapCamera
    }
    
    @objc func myLocation() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) { [self] in
            goLocation(latitudeValue: currentLocation.coordinate.latitude, longtudeValue: currentLocation.coordinate.longitude, delta: 250)
        }
    }
    
    @objc func filterAnimate(){
        if viewModel.getMoveButton().frame.width == 232 {
            viewModel.getMoveButton().setImage(#imageLiteral(resourceName: "iconEye"), for: .normal)
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
            }
        }
    }
    @objc func changeView(){
        guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC") else {
            return
        }
            
//        let transition = CATransition()
//        transition.duration = 0.2
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromRight
//        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeIn)
//        view.window!.layer.add(transition, forKey: kCATransition)
        svc.modalTransitionStyle = .crossDissolve
        svc.modalPresentationStyle = .fullScreen
        present(svc, animated: true, completion: nil)
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

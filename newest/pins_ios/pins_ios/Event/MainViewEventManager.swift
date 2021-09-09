//
//  MainViewEventManager.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/05.
//
import MapKit
import UIKit

extension ViewController{
    @objc func clickFilterMeet(){
        if viewModel.getFilterMeetButton().currentTitleColor == #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1) {
            viewModel.getFilterMeetButton().setTitleColor(#colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1), for: .normal)
        }
        else{
            viewModel.getFilterMeetButton().setTitleColor(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1), for: .normal)
        }
    }
    
    @objc func clickFilterStory(){
        if viewModel.getFilterStoryButton().currentTitleColor == #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1) {
            viewModel.getFilterStoryButton().setTitleColor(#colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1), for: .normal)
        }
        else{
            viewModel.getFilterStoryButton().setTitleColor(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1), for: .normal)
        }
    }
    
    @objc func clickFilterCommunity(){
        if viewModel.getFilterCommunityButton().currentTitleColor == #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1) {
            viewModel.getFilterCommunityButton().setTitleColor(#colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1), for: .normal)
        }
        else{
            viewModel.getFilterCommunityButton().setTitleColor(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1), for: .normal)
        }
    }
    
    @objc func changeView(){
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "SearchVC") as! SearchViewController
        
        VC1.myPosition = currentLocation
        self.navigationController!.pushViewController(VC1, animated: true)
    }
    
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
        mapCamera.altitude = 1000 // example altitude
        mapCamera.heading = 0
        
        // set the camera property
        mainMap.camera = mapCamera
    }
    
    // 중앙에 핀 생성
    @objc
    func createPinAtCenter() {
//        viewModel.AddCardView(radius: 20, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), parent: self.view)
        pinAnnotation = CustomPintAnnotation()
        pinAnnotation.pinCustomImageName = "iconLike"
        pinAnnotation.coordinate = CLLocationCoordinate2D(latitude: mainMap.centerCoordinate.latitude, longitude: mainMap.centerCoordinate.longitude)
        pinAnnotation.title = "우리집"
        pinAnnotation.subtitle = "집이 최고야"
        mainMap.addAnnotation(pinAnnotation)
    }
    
    // 버튼 이벤트 설정
    public func setButtonEvent(){
        viewModel.getMoveButton().addTarget(self, action: #selector(filterAnimate), for: .touchUpInside)
        viewModel.getAddButton().addTarget(self, action: #selector(createPinAtCenter), for: .touchUpInside)
        viewModel.getSearchButton().addTarget(self, action: #selector(changeView), for: .touchUpInside)
        viewModel.getMyLocationButton().addTarget(self, action: #selector(myLocation), for: .touchUpInside)
        viewModel.getFilterCommunityButton().addTarget(self, action: #selector(clickFilterCommunity), for: .touchUpInside)
        viewModel.getFilterMeetButton().addTarget(self, action: #selector(clickFilterMeet), for: .touchUpInside)
        viewModel.getFilterStoryButton().addTarget(self, action: #selector(clickFilterStory), for: .touchUpInside)
    }
}

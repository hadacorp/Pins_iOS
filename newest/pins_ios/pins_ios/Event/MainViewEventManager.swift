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
        VC1.latitude = mainMap.centerCoordinate.latitude
        VC1.longitude = mainMap.centerCoordinate.longitude
        self.navigationController!.pushViewController(VC1, animated: false)
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
        mapCamera.altitude = 1500 // example altitude
        mapCamera.heading = 0
        
        // set the camera property
        mainMap.camera = mapCamera
    }
    
    @objc func refreshDatas(){
        // 맵의 모든 핀을 삭제
        mainMap.removeAnnotations(mainMap.annotations)
        // 현재 화면 기준 좌표 저장
        let curPos = mainMap.centerCoordinate
        print(paramSearchText)
        if paramSearchText == ""{
            // Get API
            GetLocation().requestGet(latitude: curPos.latitude, longitude: curPos.longitude) { [self] (success, data) in
                if let data = data as? [Pin]{
                    viewModel.setCheckablePins(checkablePins: data)
                    
                    DispatchQueue.main.async {
                        pinAnnotation.removeAll()
                        initPins(pins: data)
                        startPos = CLLocationCoordinate2D(latitude: curPos.latitude, longitude: curPos.longitude)
                        if viewModel.getPinCardsCount() == 0 {
                            showToast(message: "없어요 야발.", font: UIFont(name: "NotoSansKR-Regular", size: 14)!, parent: self.view)
                        }
                    }
                }
            }
            downCardView()
        }
        else{
            // Get API
            GetKeyword().requestGet(keyword: paramSearchText!, latitude: curPos.latitude, longitude: curPos.longitude) { [self] (success, data) in
                if let data = data as? [Pin]{
                    viewModel.setCheckablePins(checkablePins: data)
                    
                    DispatchQueue.main.async {
                        pinAnnotation.removeAll()
                        initPins(pins: data)
                        startPos = CLLocationCoordinate2D(latitude: curPos.latitude, longitude: curPos.longitude)
                        if viewModel.getPinCardsCount() == 0 {
                            showToast(message: "없어요 야발.", font: UIFont(name: "NotoSansKR-Regular", size: 14)!, parent: self.view)
                        }
                    }
                }
            }
            downCardView()
        }
    }
    
    // 버튼 이벤트 설정
    public func setButtonEvent(){
        viewModel.getMoveButton().addTarget(self, action: #selector(filterAnimate), for: .touchUpInside)
        viewModel.getSearchButton().addTarget(self, action: #selector(changeView), for: .touchUpInside)
        viewModel.getMyLocationButton().addTarget(self, action: #selector(myLocation), for: .touchUpInside)
        viewModel.getFilterCommunityButton().addTarget(self, action: #selector(clickFilterCommunity), for: .touchUpInside)
        viewModel.getFilterMeetButton().addTarget(self, action: #selector(clickFilterMeet), for: .touchUpInside)
        viewModel.getFilterStoryButton().addTarget(self, action: #selector(clickFilterStory), for: .touchUpInside)
        viewModel.getRefreshButton().addTarget(self, action: #selector(refreshDatas), for: .touchUpInside)
    }
}

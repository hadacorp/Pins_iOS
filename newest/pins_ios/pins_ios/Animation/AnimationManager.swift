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
        dump(viewModel.getCardView())
    }
//    // 다음 핀으로 이동
//    func moveNextPin(){
//        if array.count > 0 {
//            self.mainMap.selectAnnotation(array[count % array.count], animated: true)
//            count += 1
//        }
//    }
    @objc func filterAnimate(){
        if viewModel.getMoveButton().frame.width == 232 {
            viewModel.getMoveButton().setImage(#imageLiteral(resourceName: "iconEye"), for: .normal)
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
                self.viewModel.getMoveButton().imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                self.viewModel.getMoveButton().snp.updateConstraints { btn in
                    btn.width.equalTo(40)
                    btn.height.equalTo(40)
                    btn.top.equalTo(60)
                    btn.trailing.equalTo(-16)
                }
                self.viewModel.getMoveButton().superview?.layoutIfNeeded()
            }
        }
        else if viewModel.getMoveButton().frame.width == 40{
            viewModel.getMoveButton().setImage(#imageLiteral(resourceName: "iconList"), for: .normal)
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
                self.viewModel.getMoveButton().imageEdgeInsets = UIEdgeInsets(top: 0, left: 202, bottom: 0, right: 10)
                self.viewModel.getMoveButton().snp.updateConstraints { btn in
                    btn.width.equalTo(232)
                    btn.height.equalTo(40)
                    btn.top.equalTo(60)
                    btn.trailing.equalTo(-16)
                }
                self.viewModel.getMoveButton().superview?.layoutIfNeeded()
            }
        }
    }
    @objc func onClickSearchBtn(){
        print(viewModel.getSearchButton().frame.width)
        if viewModel.getSearchButton().frame.width == 40{
            viewModel.getSearchButton().layer.borderWidth = 1
            viewModel.getSearchButton().layer.borderColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
            // 뒷배경 뷰 생성 후 내려오게 하기
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
                self.viewModel.getSearchButton().imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width - 72)
                self.viewModel.getSearchButton().snp.updateConstraints { btn in
                    btn.leading.equalTo(16)
                    btn.top.equalTo(60)
                    btn.height.equalTo(40)
                    btn.width.equalTo(UIScreen.main.bounds.width - 32)
                }
                self.viewModel.getSearchButton().superview?.layoutIfNeeded()
                
                
                self.viewModel.getSearchBackground().snp.updateConstraints { bg in
                    bg.top.equalTo(0)
                }
                self.viewModel.getSearchBackground().superview?.layoutIfNeeded()
            }
            // 맨 앞으로 가져오기
            self.view.bringSubviewToFront(self.viewModel.getSearchButton())
            viewModel.getSearchButton().setImage(#imageLiteral(resourceName: "iconBack"), for: .normal)
        }
        
        else{
            viewModel.getSearchButton().layer.borderWidth = 0

            self.viewModel.getSearchButton().imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
                // 돋보기 버튼 애니메이션
                self.viewModel.getSearchButton().snp.updateConstraints { btn in
                    btn.leading.equalTo(16)
                    btn.top.equalTo(60)
                    btn.height.equalTo(40)
                    btn.width.equalTo(40)
                }
                self.viewModel.getSearchButton().superview?.layoutIfNeeded()
                
                // 뒷배경 애니메이션
                self.viewModel.getSearchBackground().snp.updateConstraints { bg in
                    bg.top.equalTo(-UIScreen.main.bounds.height)
                }
                self.viewModel.getSearchBackground().superview?.layoutIfNeeded()
            }
            viewModel.getSearchButton().setImage(#imageLiteral(resourceName: "icon"), for: .normal)
        }
    }
}

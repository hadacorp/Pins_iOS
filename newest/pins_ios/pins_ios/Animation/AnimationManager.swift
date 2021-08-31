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
        viewModel.getMoveButton().setImage(#imageLiteral(resourceName: "iconEye"), for: .normal)
        if viewModel.getMoveButton().frame.width == 232 {
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
}

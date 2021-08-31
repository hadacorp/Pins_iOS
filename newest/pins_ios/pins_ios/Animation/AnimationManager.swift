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
    @objc func onClickSearchBtn(){
        guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC") else {
            return
        }
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
                self.view.window!.layer.add(transition, forKey: kCATransition)
        svc.modalPresentationStyle = .fullScreen
        present(svc, animated: false)
//        //storyboard를 통해 두번쨰 화면의 storyboard ID를 참조하여 뷰 컨트롤러를 가져옵니다.
//        guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC") else {
//            return
//        }
//
//        //화면 전환 애니메이션을 설정합니다. coverVertical 외에도 다양한 옵션이 있습니다.
//        svc.modalTransitionStyle = .partialCurl
//        svc.modalPresentationStyle = .fullScreen
//
//        //인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드를 호출합니다.
//        self.present(svc, animated: true)
    }
}

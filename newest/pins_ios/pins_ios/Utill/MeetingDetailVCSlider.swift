//
//  Slider.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/11.
//

import UIKit

extension MeetingDetailVC{
    public func singleSlider(top: CGFloat){
        scrollView.addSubview(backgroundGray)
        backgroundGray.snp.makeConstraints { bg in
            bg.top.equalTo(top)
            bg.leading.equalTo(32)
            bg.width.equalTo(UIScreen.main.bounds.width - 64)
            bg.height.equalTo(4)
        }
        backgroundGray.layer.cornerRadius = 3
        backgroundGray.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        
        scrollView.addSubview(backgroundBlue)
        backgroundBlue.snp.makeConstraints { bg in
            bg.top.equalTo(top)
            bg.leading.equalTo(32)
            bg.width.equalTo(0)
            bg.height.equalTo(4)
        }
        backgroundBlue.layer.cornerRadius = 3
        backgroundBlue.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6666666667, blue: 0.9529411765, alpha: 1)
        
        let circleView = UIView(frame: CGRect(x: 18, y: top - 12, width: 28, height: 28))
        scrollView.addSubview(circleView)
        circleView.backgroundColor = .white
        circleView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.04)
        circleView.layer.borderWidth = 0.5
        circleView.layer.cornerRadius = 14
        circleView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        circleView.layer.shadowOpacity = 0.15
        circleView.layer.shadowRadius = 8
        circleView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(singleDrag(sender:)))
        circleView.addGestureRecognizer(panGesture)
    }
    
    @objc func singleDrag(sender: UIPanGestureRecognizer) {
        // self는 여기서 ViewController이므로 self.view ViewController가 기존에가지고 있는 view이다.
        let translation = sender.translation(in: scrollView) // translation에 움직인 위치를 저장한다.

        // sender의 view는 sender가 바라보고 있는 circleView이다. 드래그로 이동한 만큼 circleView를 이동시킨다.
        // 젤 왼쪽으로 갔을 때
        if sender.view!.center.x + translation.x < leading{
            sender.view!.center = CGPoint(x: leading, y: sender.view!.center.y)
            backgroundBlue.snp.updateConstraints { bg in
                bg.width.equalTo(0)
            }
        }
        // 젤 오른쪽으로 갔을 때
        else if sender.view!.center.x + translation.x > trailing{
            sender.view!.center = CGPoint(x: trailing, y: sender.view!.center.y)
            backgroundBlue.snp.updateConstraints { bg in
                bg.width.equalTo(backgroundGray.frame.width)
            }
        }
        // 사이에서 움직일 때
        else{
            sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y)
            backgroundBlue.snp.updateConstraints { bg in
                bg.width.equalTo(sender.view!.center.x + translation.x - leading)
            }
            viewModel.setJoinCount(width: Int(backgroundGray.frame.width), cur: Int(sender.view!.center.x + translation.x - leading))
            viewModel.setCountDescription(string: "\(viewModel.getJoinCount())명")
            sender.setTranslation(.zero, in: view) // 0으로 움직인 값을 초기화 시켜준다.
        }
    }
}

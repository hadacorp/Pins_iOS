//
//  ViewController.swift
//  Pins
//
//  Created by judongseok on 2022/01/12.
//

import UIKit

class ViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        // 위측 버튼 2개
        CustomButton(type: .small, parent: safetyArea)
            .setSize(width: 40, height: 40)
            .setupConstraints(top: 16, leading: 16)
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        CustomButton(type: .small, parent: safetyArea)
            .setSize(width: 40, height: 40)
            .setupConstraints(top: 16, leading: UIScreenSize.shared.width - 56)
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        // 하단 작은 버튼 2개
        CustomButton(type: .small, parent: safetyArea)
            .setSize(width: 40, height: 40)
            .setupConstraints(top: UIScreenSize.shared.safeHeight - 124, leading: 16)
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        CustomButton(type: .small, parent: safetyArea)
            .setSize(width: 40, height: 40)
            .setupConstraints(top: UIScreenSize.shared.safeHeight - 124, leading: UIScreenSize.shared.width - 56)
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        // 하단 중간 버튼 3개
        CustomButton(type: .middle, parent: safetyArea)
            .setSize(width: 50, height: 50)
            .setupConstraints(top: UIScreenSize.shared.safeHeight - 64, leading: 16)
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        CustomButton(type: .middle, parent: safetyArea)
            .setSize(width: 50, height: 50)
            .setupConstraints(top: UIScreenSize.shared.safeHeight - 64, leading: UIScreenSize.shared.width / 2 - 25)
            .setColor(color: UIColor(hex: "1059FF").cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
        
        CustomButton(type: .middle, parent: safetyArea)
            .setSize(width: 50, height: 50)
            .setupConstraints(top: UIScreenSize.shared.safeHeight - 64, leading: UIScreenSize.shared.width - 56)
            .setColor(color: UIColor.white.cgColor)
            .setRounded(size: 16)
            .setShadow(x: 0, y: 4, blur: 8, opacity: 0.16, color: UIColor(hex: "666666").cgColor)
            .setOpacity(opacity: 0.9)
            .addTarget(self, action: #selector(printLog), for: .touchUpInside)
    }
    
    @objc func printLog() {
        print("button clicked!")
    }
}

// 전처리
#if DEBUG

import SwiftUI
@available(iOS 13.0, *)

// UIViewControllerRepresentable을 채택
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    // _ uiViewController: UIViewController로 지정
    func updateUIViewController(_ uiViewController: UIViewController , context: Context) {
        
    }
    // makeui
    func makeUIViewController(context: Context) -> UIViewController {
    // Preview를 보고자 하는 Viewcontroller 이름
    // e.g.)
        ViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    
    @available(iOS 13.0, *)
    static var previews: some View {
        // UIViewControllerRepresentable에 지정된 이름.
        ViewControllerRepresentable()

// 테스트 해보고자 하는 기기
            .previewDevice("iPhone 11")
    }
}
#endif

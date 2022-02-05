//
//  SearchViewController.swift
//  Pins
//
//  Created by judongseok on 2022/01/18.
//

import Foundation

class SearchViewController: BaseViewController {
    // MARK: - Property
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        CustomTextField(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(16)
                $0.trailing.equalTo(-16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
                $0.height.equalTo(40)
            }
            .setBorder(color: UIColor(hex: "666666"), width: 1)
            .setRounded(size: 16)
            .setPadding(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            .setCursorColor(color: UIColor(hex: "000000"))
            .setFont(name: "NotoSansKR-Regular", size: 16)
        
        CustomButton(parent: self.view)
            .makeConstraints{
                $0.leading.equalTo(16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
                $0.width.height.equalTo(40)
            }
            .setImage(image: UIImage(named: "back")!)
            .setAction(parent: self, action: #selector(backBtn))
        
        CustomButton(parent: self.view)
            .makeConstraints{
                $0.trailing.equalTo(-16)
                $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
                $0.width.height.equalTo(40)
            }
            .setImage(image: UIImage(named: "cancel")!)
    }
}

// 전처리
#if DEBUG

import SwiftUI
@available(iOS 13.0, *)

// UIViewControllerRepresentable을 채택
struct SearchViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    // _ uiViewController: UIViewController로 지정
    func updateUIViewController(_ uiViewController: UIViewController , context: Context) {
        
    }
    // makeui
    func makeUIViewController(context: Context) -> UIViewController {
    // Preview를 보고자 하는 Viewcontroller 이름
    // e.g.)
        SearchViewController()
    }
}

struct SearchViewController_Previews: PreviewProvider {
    
    @available(iOS 13.0, *)
    static var previews: some View {
        // UIViewControllerRepresentable에 지정된 이름.
        SearchViewControllerRepresentable()
// 테스트 해보고자 하는 기기
            .previewDevice("iPhone 13 mini")
    }
}
#endif

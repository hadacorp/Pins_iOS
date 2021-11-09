//
//  StoryDetailVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/09.
//

import UIKit

class StoryDetailVC: UIViewController {
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    override func viewDidLoad() {
        createTriangle()
    }
    
    // MARK:- 상단 작은 삼각형
    public func createTriangle(){
        let blueTri = UIImageView(image: UIImage(named: "iconTriangleBlue"))
        let whiteTri = UIImageView(image: UIImage(named: "iconTriangleWhite"))
        
        self.view.addSubview(blueTri)
        self.view.addSubview(whiteTri)
        
        whiteTri.snp.makeConstraints { make in
            make.width.equalTo(4)
            make.height.equalTo(6)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.leading.equalTo(UIScreen.main.bounds.width / 3 - 2)
        }
        
        blueTri.snp.makeConstraints { make in
            make.width.equalTo(4)
            make.height.equalTo(6)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.trailing.equalTo(-UIScreen.main.bounds.width / 3 + 2)
        }
    }
}

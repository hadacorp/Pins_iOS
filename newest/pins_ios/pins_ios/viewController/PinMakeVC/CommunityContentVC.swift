//
//  CommunityContentVC.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/31.
//

import UIKit

class CommunityContentVC: UIViewController {
    override func viewDidLoad() {
        setUI()
    }
    
    private func setUI(){
        initImageView()
        createTriangle()
    }
    
    private func initImageView(){
        let btn = UIButton()
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.width.height.equalTo(110)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(104)
            make.centerX.equalTo(view)
        }
        
        btn.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9647058824, blue: 1, alpha: 1)
        btn.layer.cornerRadius = 8
        
        initImageViewIcon(parent: btn)
        initImageViewText(parent: btn)
    }
    private func initImageViewIcon(parent: UIView){
        let img = UIImageView(image: #imageLiteral(resourceName: "iconCamera"))
        parent.addSubview(img)
        img.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(17)
            make.top.equalTo(39)
            make.centerX.equalTo(parent)
        }
    }
    private func initImageViewText(parent: UIView){
        let text = UILabel()
        parent.addSubview(text)
        text.snp.makeConstraints { make in
            make.width.equalTo(75)
            make.height.equalTo(17)
            make.top.equalTo(56)
            make.centerX.equalTo(parent)
        }
        text.text = "대표 이미지 0/1"
        text.textColor = #colorLiteral(red: 0.5450980392, green: 0.5921568627, blue: 0.6941176471, alpha: 1)
        text.font = UIFont(name: "NotoSansKR-Regular", size: 11)
    }
    public func createTriangle(){
        let whiteTriF = UIImageView(image: UIImage(named: "iconTriangleWhite"))
        let whiteTriS = UIImageView(image: UIImage(named: "iconTriangleWhite"))
        
        self.view.addSubview(whiteTriF)
        self.view.addSubview(whiteTriS)
        
        whiteTriF.snp.makeConstraints { make in
            make.width.equalTo(4)
            make.height.equalTo(6)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.leading.equalTo(UIScreen.main.bounds.width / 3 - 2)
        }
        
        whiteTriS.snp.makeConstraints { make in
            make.width.equalTo(4)
            make.height.equalTo(6)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(66)
            make.trailing.equalTo(-UIScreen.main.bounds.width / 3 + 2)
        }
    }
}

//
//  CardDetail+CustomCell.swift
//  Pins
//
//  Created by judongseok on 2022/02/19.
//

import UIKit

class CardDetailCustomCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        backgroundSetup()
        uiSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func backgroundSetup() {
        contentView.backgroundColor = UIColor.white
    }
    
    func setLastItem() {
        for i in contentView.subviews {
            i.removeFromSuperview()
        }
        
        CustomButton(parent: contentView)
            .makeConstraints {
                $0.top.equalTo(0)
                $0.centerX.equalTo(self.contentView)
                $0.width.height.equalTo(50)
            }
            .setColor(color: UIColor.init(hex: "EEEEEE").cgColor)
            .setRounded(size: 25)
        
        CustomLabel(parent: contentView)
            .makeConstraints {
                $0.top.equalTo(58)
                $0.centerX.equalTo(self.contentView)
                $0.height.equalTo(12)
            }
            .setText(text: "더보기")
            .setFont(name: "NotoSansKR-Regular", size: 10)
            .setColor(color: .black)
    }
    
    func uiSetup() {
        CustomImage(parent: contentView)
            .makeConstraints {
                $0.top.equalTo(0)
                $0.centerX.equalTo(self.contentView)
                $0.width.height.equalTo(50)
            }
            .setImage(image: UIImage(named: "catimage")!)
            .setRadius(size: 25)
        
        CustomLabel(parent: contentView)
            .makeConstraints {
                $0.top.equalTo(58)
                $0.centerX.equalTo(self.contentView)
                $0.height.equalTo(12)
            }
            .setText(text: "닉네임할거없다고")
            .setFont(name: "NotoSansKR-Regular", size: 10)
            .setColor(color: .black)
    }
}

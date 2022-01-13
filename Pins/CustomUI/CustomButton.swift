//
//  RoundedButton.swift
//  Pins
//
//  Created by judongseok on 2022/01/12.
//
import UIKit
import SnapKit

// 버튼 타입
public enum CustomButtonType {
    case big
    case middle
    case small
}

// 커스텀 버튼
class CustomButton: UIButton {
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    init() {
        super.init(frame: CGRect.zero)
    }

    convenience init(type: CustomButtonType, parent: UIView) {
        self.init()
        
        switch type {
        case .big:
            width = 300
            height = 300
        case .middle:
            width = 200
            height = 200
        case .small:
            width = 100
            height = 100
        }
        
        parent.addSubview(self)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func setupConstraints(top: CGFloat, leading: CGFloat) -> CustomButton {
        // 제약사항에 관한 세팅들
        self.snp.makeConstraints { make in
            make.top.equalTo(top)
            make.leading.equalTo(leading)
        }
        return self
    }
    
    func setSize(width: CGFloat, height: CGFloat) -> CustomButton {
        self.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        return self
    }
    
    func setColor(color: CGColor) -> CustomButton {
        self.layer.backgroundColor = color
        return self
    }
    
    func setRounded(size: CGFloat) -> CustomButton {
        self.layer.cornerRadius = size
        return self
    }
    
    func setShadow(x: CGFloat, y: CGFloat, blur: CGFloat, opacity: Float, color: CGColor) -> CustomButton {
        self.layer.shadowColor = color
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowRadius = blur
        return self
    }
    
    func setOpacity(opacity: Float) -> CustomButton {
        self.layer.opacity = opacity
        
        return self
    }
}

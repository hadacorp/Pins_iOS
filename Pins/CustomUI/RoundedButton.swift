//
//  RoundedButton.swift
//  Pins
//
//  Created by judongseok on 2022/01/12.
//
import UIKit
import SnapKit

// 버튼 타입
public enum RoundedButtonType {
    case big
    case middle
    case small
}

// 라운드 버튼
class RoundedButton: UIButton {
    var height: CGFloat = 0
    var width: CGFloat = 0
    var color: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    init() {
        super.init(frame: CGRect.zero)
    }

    convenience init(type: RoundedButtonType, parent: UIView) {
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
    
    func setupConstraints(top: CGFloat, leading: CGFloat) -> RoundedButton {
        // 제약사항에 관한 세팅들
        self.snp.makeConstraints { make in
            make.top.equalTo(top)
            make.leading.equalTo(leading)
        }
        return self
    }
    
    func setSize(width: CGFloat, height: CGFloat) -> RoundedButton {
        self.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        return self
    }
    
    func setColor(color: CGColor) -> RoundedButton {
        self.layer.backgroundColor = color
        return self
    }
    
    func setRounded(size: CGFloat) -> RoundedButton {
        self.layer.cornerRadius = size
        return self
    }
    
    func setShadow(x: CGFloat, y: CGFloat, blur: CGFloat, opacity: Float, color: CGColor) -> RoundedButton {
        self.layer.shadowColor = color
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowRadius = blur
        return self
    }
}

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
        print("ARC count ++")
    }
    
    deinit {
//        UIStorage.shared.releaseUI(id: id)
        print("ARC count --")
    }

    convenience init(parent: UIView) {
        self.init()
//        UIStorage.shared.addUI(id: id, UI: self)
        parent.addSubview(self)
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
    
    @discardableResult public func setSize(width: CGFloat, height: CGFloat) -> CustomButton {
        self.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        return self
    }
    
    @discardableResult public func setImage(image: UIImage) -> CustomButton {
        self.setImage(image, for: .normal)
        return self
    }
    
    @discardableResult public func setColor(color: CGColor) -> CustomButton {
        self.layer.backgroundColor = color
        return self
    }
    
    @discardableResult public func setRounded(size: CGFloat) -> CustomButton {
        self.layer.cornerRadius = size
        return self
    }
    
    @discardableResult public func setShadow(x: CGFloat, y: CGFloat, blur: CGFloat, opacity: Float, color: CGColor) -> CustomButton {
        self.layer.shadowColor = color
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowRadius = blur
        return self
    }
    
    @discardableResult public func setOpacity(opacity: Float) -> CustomButton {
        self.layer.opacity = opacity
        return self
    }
    
    @discardableResult public func makeConstraints(_ maker: @escaping (ConstraintMaker) -> Void) -> CustomButton {
        self.snp.makeConstraints { maker($0) }
        return self
    }
    
    @discardableResult public func setAction(parent: Any, action: Selector) -> CustomButton {
        self.addTarget(parent, action: action, for: .touchUpInside)
        return self
    }
    
    @discardableResult public func setTitle(title: String) -> CustomButton {
        self.setTitle(title, for: .normal)
        return self
    }
    
    @discardableResult public func setTitleFont(name: String, size: CGFloat) -> CustomButton {
        self.titleLabel?.font = UIFont(name: name, size: size)
        return self
    }
}

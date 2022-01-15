//
//  CustomLabel.swift
//  Pins
//
//  Created by judongseok on 2022/01/13.
//
import UIKit
import SnapKit

// 커스텀 라벨
class CustomLabel: UILabel {
    init() {
        super.init(frame: CGRect.zero)
    }
    
    convenience init(parent: UIView) {
        self.init()
        
        parent.addSubview(self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    @discardableResult public func setFont(name: String, size: CGFloat) -> CustomLabel {
        self.font = UIFont(name: name, size: size)
        
        return self
    }
    
    @discardableResult public func setColor(color: UIColor) -> CustomLabel {
        self.textColor = color
        
        return self
    }
    
    @discardableResult public func setText(text: String) -> CustomLabel {
        self.text = text
        
        return self
    }
    
    @discardableResult public func makeConstraints(_ maker: @escaping (ConstraintMaker) -> Void) -> CustomLabel {
        self.snp.makeConstraints { maker($0) }
        return self
    }
}

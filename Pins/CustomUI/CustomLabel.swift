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
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    func setFont(name: String, size: CGFloat) -> CustomLabel {
        self.font = UIFont(name: name, size: size)
        
        return self
    }
    
    func setColor(color: UIColor) -> CustomLabel {
        self.textColor = color
        
        return self
    }
}

//
//  CustomTextField.swift
//  Pins
//
//  Created by judongseok on 2022/01/18.
//

import UIKit
import SnapKit
import SwiftUI

class CustomTextField: UITextField {
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
    
    @discardableResult public func setRounded(size: CGFloat) -> CustomTextField {
        self.layer.cornerRadius = size
        return self
    }
    
    @discardableResult public func setBorder(color: UIColor, width: CGFloat) -> CustomTextField {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        
        return self
    }
    
    @discardableResult public func setPadding(frame: CGRect) -> CustomTextField {
        let paddingView = UIView(frame: frame)
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
        return self
    }
    
    @discardableResult public func setCursorColor(color: UIColor) -> CustomTextField {
        self.tintColor = color
        return self
    }
    
    @discardableResult public func setFont(name: String, size: CGFloat) -> CustomTextField {
        self.font = UIFont(name: name, size: size)
        
        return self
    }
    
    @discardableResult public func setColor(color: UIColor) -> CustomTextField {
        self.backgroundColor = color
        
        return self
    }
    
    @discardableResult public func makeConstraints(_ maker: @escaping (ConstraintMaker) -> Void) -> CustomTextField {
        self.snp.makeConstraints { maker($0) }
        return self
    }
}

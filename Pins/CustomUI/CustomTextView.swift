//
//  CustomTextView.swift
//  Pins
//
//  Created by judongseok on 2022/03/07.
//

import UIKit
import SnapKit
import SwiftUI

class CustomTextView: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: CGRect.zero, textContainer: nil)
    }
    
    convenience init(parent: UIView) {
        self.init()
        parent.addSubview(self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    @discardableResult public func setRounded(size: CGFloat) -> CustomTextView {
        self.layer.cornerRadius = size
        return self
    }
    
    @discardableResult public func setBorder(color: UIColor, width: CGFloat) -> CustomTextView {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        
        return self
    }
    
    @discardableResult public func setCursorColor(color: UIColor) -> CustomTextView {
        self.tintColor = color
        return self
    }
    
    @discardableResult public func setFont(name: String, size: CGFloat) -> CustomTextView {
        self.font = UIFont(name: name, size: size)
        
        return self
    }
    
    @discardableResult public func setColor(color: UIColor) -> CustomTextView {
        self.backgroundColor = color
        
        return self
    }
    
    @discardableResult public func setPadding(padding: UIEdgeInsets) -> CustomTextView {
        self.textContainerInset = padding
        
        return self
    }
    
    @discardableResult public func makeConstraints(_ maker: @escaping (ConstraintMaker) -> Void) -> CustomTextView {
        self.snp.makeConstraints { maker($0) }
        return self
    }
}

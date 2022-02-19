//
//  CustomLabel.swift
//  Pins
//
//  Created by judongseok on 2022/01/13.
//
import UIKit
import SnapKit

struct Category {
    let accident = 65
}

// 커스텀 라벨
class CustomLabel: UILabel {
    
    var topInset: CGFloat = 0
    var bottomInset: CGFloat = 0
    var leftInset: CGFloat = 0
    var rightInset: CGFloat = 0
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    convenience init(parent: UIView) {
        self.init()
        
        parent.addSubview(self)
    }
    
    convenience init(parent: UIView, top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.init()
        
        parent.addSubview(self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    override func drawText(in rect: CGRect) {
            let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
            super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
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
    
    @discardableResult public func setBackgroundColor(color: UIColor) -> CustomLabel {
        self.backgroundColor = color
        
        return self
    }
    
    @discardableResult public func setRadius(size: CGFloat) -> CustomLabel {
        self.layer.cornerRadius = size
        self.clipsToBounds = true
        
        return self
    }
    
    @discardableResult public func setAlignment(alignment: NSTextAlignment) -> CustomLabel {
        self.textAlignment = alignment
        
        return self
    }
    
    @discardableResult public func setLineHeight(size: Int) -> CustomLabel {
        self.numberOfLines = size
        return self
    }
    
    @discardableResult public func makeConstraints(_ maker: @escaping (ConstraintMaker) -> Void) -> CustomLabel {
        self.snp.makeConstraints { maker($0) }
        return self
    }
}

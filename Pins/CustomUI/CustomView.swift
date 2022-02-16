//
//  CustomView.swift
//  Pins
//
//  Created by judongseok on 2022/02/17.
//

import Foundation
import UIKit
import SnapKit

class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
    }
    
    convenience init(parent: UIView) {
        self.init(frame: CGRect.zero)
        
        parent.addSubview(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult public func setColor(color: UIColor) -> CustomView {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult public func makeConstraints(_ maker: @escaping (ConstraintMaker) -> Void) -> CustomView {
        self.snp.makeConstraints { maker($0) }
        return self
    }
    
    @discardableResult public func setRadius(size: CGFloat) -> CustomView {
        self.layer.cornerRadius = size
        self.clipsToBounds = true
        return self
    }
}

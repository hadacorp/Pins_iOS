//
//  CustomImage.swift
//  Pins
//
//  Created by judongseok on 2022/02/11.
//

import UIKit
import SnapKit

class CustomImage: UIImageView {
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
    
    @discardableResult public func setContentMode(mode: UIView.ContentMode) -> CustomImage {
        self.contentMode = mode
        
        return self
    }
    
    @discardableResult public func setImage(image: UIImage) -> CustomImage {
        self.image = image
        
        return self
    }
    
    @discardableResult public func makeConstraints(_ maker: @escaping (ConstraintMaker) -> Void) -> CustomImage {
        self.snp.makeConstraints { maker($0) }
        return self
    }
    
    @discardableResult public func setRadius(size: CGFloat) -> CustomImage {
        self.layer.cornerRadius = size
        self.clipsToBounds = true
        return self
    }

}

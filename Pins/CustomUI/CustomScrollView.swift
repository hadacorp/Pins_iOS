//
//  CustomScrollView.swift
//  Pins
//
//  Created by judongseok on 2022/02/19.
//
import UIKit
import SnapKit

class CustomScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(parent: UIView) {
        self.init(frame: CGRect(x: 0, y: 0, width: UIScreenSize.shared.width, height: UIScreenSize.shared.height))
                
        parent.addSubview(self)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }

    @discardableResult public func setBackgroundColor(color: UIColor) -> CustomScrollView {
        self.backgroundColor = color

        return self
    }

    @discardableResult public func makeConstraints(_ maker: @escaping (ConstraintMaker) -> Void) -> CustomScrollView {
        self.snp.makeConstraints { maker($0) }
        return self
    }
    
    @discardableResult public func setDelegate(view: Any) -> CustomScrollView {
        self.delegate = view as? UIScrollViewDelegate
        return self
    }
}

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
    
    func setFont(name: String, size: CGFloat) -> CustomLabel {
        self.font = UIFont(name: name, size: size)
        
        return self
    }
    
    func setColor(color: UIColor) -> CustomLabel {
        self.textColor = color
        
        return self
    }
    
    func setText(text: String) -> CustomLabel {
        self.text = text
        
        return self
    }
    
    func setupConstraints(top: CGFloat, leading: CGFloat) -> CustomLabel {
        // 제약사항에 관한 세팅들
        self.snp.makeConstraints { make in
            make.top.equalTo(top)
            make.leading.equalTo(leading)
        }
        return self
    }
    
    func setCenterXConstraint(top: CGFloat, center: UIView) -> CustomLabel {
        self.snp.makeConstraints { make in
            make.centerX.equalTo(center)
            make.top.equalTo(top)
        }
        return self
    }
    
    func end() { }
}

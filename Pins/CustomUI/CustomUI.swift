//
//  CustomUI.swift
//  Pins
//
//  Created by judongseok on 2022/01/17.
//

import UIKit
import SnapKit

protocol CustomUI: UIView {
    @discardableResult func makeConstraints(_ maker: @escaping (ConstraintMaker) -> Void) -> CustomUI
}


extension CustomUI {
    func makeConstraints(_ maker: @escaping (ConstraintMaker) -> Void) -> CustomUI {
        self.snp.makeConstraints { maker($0) }
        return self
    }
}

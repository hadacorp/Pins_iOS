//
//  Extension+UITextField.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/12.
//

import UIKit

public extension UITextField {
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
    
}

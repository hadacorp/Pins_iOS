//
//  LabelButton.swift
//  pins_ios
//
//  Created by judongseok on 2021/11/22.
//

import UIKit

open class LabelButton: UILabel{
    var onClick: () -> Void = {}
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public convenience init(){
        self.init(frame: .zero)
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        onClick()
    }
}

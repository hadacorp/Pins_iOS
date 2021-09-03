//
//  searchVCUI.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/01.
//

import UIKit

class SearchVCUI {
    public var cancelButton = UIButton()
    init(parent: UIView?, layout: UILayoutGuide?) {
        if let parent = parent{
            if let layout = layout{
                initCancelButton(parent: parent, layout: layout)
            }
        }
    }
    
    func initCancelButton(parent: UIView, layout: UILayoutGuide){
        parent.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { btn in
            btn.top.equalTo(layout).offset(16)
            btn.trailing.equalTo(-16)
            btn.width.height.equalTo(40)
        }
        cancelButton.setImage(#imageLiteral(resourceName: "iconCancel"), for: .normal)
    }
}

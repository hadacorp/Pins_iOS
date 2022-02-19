//
//  CardDetail+CustomCell.swift
//  Pins
//
//  Created by judongseok on 2022/02/19.
//

import UIKit

class CardDetailCustomCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        backgroundSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func backgroundSetup() {
        self.backgroundColor = UIColor.white
    }
}

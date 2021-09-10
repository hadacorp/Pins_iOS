//
//  CarouselCell.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/10.
//

import UIKit

class CarouselCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(color: UIColor){
        self.backgroundColor = color
        self.layer.cornerRadius = 16
        self.layer.shadowOpacity = 0.16
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 8
    }
}

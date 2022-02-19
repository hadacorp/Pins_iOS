//
//  ViewController+CustomCell.swift
//  Pins
//
//  Created by judongseok on 2022/02/11.
//

import UIKit

class ViewControllerCustomCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        backgroundSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func backgroundSetup() {
        self.backgroundColor = UIColor.white
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.16).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        self.layer.cornerRadius = 25
    }
}

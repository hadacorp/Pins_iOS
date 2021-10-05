//
//  MeetingFilterCell.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/05.
//

import UIKit

class MeetingFilterCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(color: UIColor){
        self.backgroundColor = color
    }
}

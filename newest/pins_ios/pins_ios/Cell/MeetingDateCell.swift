//
//  MeetingDateCell.swift
//  pins_ios
//
//  Created by judongseok on 2021/10/08.
//

import UIKit

class MeetingDateCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(color: UIColor, text: String){
        let label = UILabel()
        label.text = text
        label.textColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
        label.numberOfLines = 2
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        label.textAlignment = .center
        self.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(20)
            make.height.equalTo(56)
        }
        self.layer.cornerRadius = 8
        self.backgroundColor = color
    }
}

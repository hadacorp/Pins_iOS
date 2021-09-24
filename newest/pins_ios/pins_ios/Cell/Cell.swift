//
//  Cell.swift
//  pins_ios
//
//  Created by judongseok on 2021/09/04.
//

import UIKit

class Cell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var distance: UIButton!
    var type: Int!
}

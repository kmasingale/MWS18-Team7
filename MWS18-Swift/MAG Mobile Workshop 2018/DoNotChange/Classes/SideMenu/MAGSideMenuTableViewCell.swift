//
//  MAGSideMenuTableViewCell.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-13.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit

class MAGSideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }
}

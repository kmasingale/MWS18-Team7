//
//  MAGTextField.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit
import Material

class MAGTextField: TextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.dividerNormalColor = UIColor.primaryColor()
        self.dividerActiveColor = UIColor.secondaryColor()
        self.font = UIFont(name: "HavelticaNeu", size: 14)
        self.placeholderActiveColor = UIColor.secondaryColor()
        self.placeholderActiveScale = 0.5
        self.placeholderVerticalOffset = 0.3
    }
}

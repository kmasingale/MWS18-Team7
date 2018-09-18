//
//  MAGButton.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit
import Material

class MAGButton: RaisedButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.secondaryColor()
        self.tintColor = UIColor.white
    }
}

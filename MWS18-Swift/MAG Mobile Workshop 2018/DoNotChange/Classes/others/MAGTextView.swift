//
//  MAGTextView.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit

class MAGTextView: UITextView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let grayColor = UIColor.lightGray
        self.backgroundColor = grayColor.withAlphaComponent(0.5)
    }
}

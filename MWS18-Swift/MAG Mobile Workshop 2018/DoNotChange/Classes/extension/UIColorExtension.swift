//
//  UIColorExtension.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-13.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)
        }
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    static func primaryColor() -> UIColor {
        
        if ((Bundle.main.infoDictionary?["isSecondaryApp"]) != nil)
        {
            return UIColor(hexFromString: "#0A5591")
        }
        else {
            return UIColor(hexFromString: "#58676C")
        }
    }
    
    static func secondaryColor() -> UIColor {
        
        if ((Bundle.main.infoDictionary?["isSecondaryApp"]) != nil)
        {
            return UIColor(hexFromString: "#0A5591")
        }
        else {
            return UIColor(hexFromString: "#2E9AA9")
        }
    }
    
}

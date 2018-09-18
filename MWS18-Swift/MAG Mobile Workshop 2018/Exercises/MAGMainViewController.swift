//
//  MAGMainViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-13.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit
import Material
import MASFoundation

class MAGMainViewController: MAGBaseViewController {
    
    @IBOutlet weak var imageView: UIImageView?

    open override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        //
        //  Applying white color overlay on CA Logo
        //
        imageView?.setImageColor(color: UIColor.white)
        
        //
        //  As this is main root view controller, you can place any code that needs to be executed once
        //
        
        //Start MAS
        MAS.setGrantFlow(MASGrantFlow.password)
        MAS.start(withDefaultConfiguration: true) { (completed, error) in
            print ("...Starting MAS!")
            if (completed == true) {
                print ("MAS start completed!")
            } else {
                print ("MAS   NOT   STARTED.  Errors: ")
                print (error!)
            }
        }
    }
}


extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

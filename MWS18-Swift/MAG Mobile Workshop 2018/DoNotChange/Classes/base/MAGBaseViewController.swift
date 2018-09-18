//
//  ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-13.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit

class MAGBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_menu_white"), style: .plain, target: self, action: #selector(handleMenuButton))
    }
}

extension MAGBaseViewController {
    @objc
    fileprivate func handleMenuButton() {
        navigationDrawerController?.toggleRightView()
    }
    
    @objc
    internal func handleResignResponderButton(button: UIButton) {
        view.endEditing(true)
    }
}

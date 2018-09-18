//
//  AppDelegate.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-13.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit
import Material

extension UIStoryboard {
    class func viewController(identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var rootViewController: MAGMainViewController = {
        return UIStoryboard.viewController(identifier: "MAGMainViewController") as! MAGMainViewController
    }()
    
    lazy var rightViewController: MAGSideMenuTableViewController = {
        return UIStoryboard.viewController(identifier: "RightViewController") as! MAGSideMenuTableViewController
    }()

    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        let appToolbarController = MAGToolbarController(rootViewController: rootViewController)
        let appNavigationController = MAGNavigationController(rootViewController: appToolbarController,
                                                             leftViewController: nil,
                                                             rightViewController: rightViewController)
        appNavigationController.setRightViewWidth(width: 200, isHidden: true, animated: true)

        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        appToolbarController.navigationBar.barTintColor = UIColor.primaryColor()
        
        window = UIWindow(frame: Screen.bounds)
        window!.rootViewController = appNavigationController
        window!.makeKeyAndVisible()
    }
}


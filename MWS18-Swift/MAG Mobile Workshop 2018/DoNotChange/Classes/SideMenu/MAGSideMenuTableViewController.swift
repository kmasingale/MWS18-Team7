//
//  MAGSideMenuTableViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-13.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit

class MAGSideMenuTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate var menuItems: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIGraphicsBeginImageContext(view.frame.size)
        UIImage(named: "BackgroundImage")?.draw(in: view.bounds)
        let image:UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        tableView.backgroundColor = UIColor(patternImage: image)
        
        menuItems = ["Exercise 1","Exercise 2","Exercise 3","Exercise 4","Exercise 5","Exercise 6","Exercise 7","Exercise 8","Exercise 9","Exercise 10"]
    }
}

extension MAGSideMenuTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MAGSideMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MAGSideMenuTableViewCell
        cell.titleLabel.text = menuItems[indexPath.row]
        cell.separatorView.isHidden = true
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var viewController:MAGBaseViewController?
        
        let exerciseNumber = indexPath.row + 1
        
        switch exerciseNumber {
        case 1:
            viewController = MAGExercise1ViewController(nibName: "MAGExercise1ViewController", bundle: nil)
            break;
        case 2:
            viewController = MAGExercise2ViewController(nibName: "MAGExercise2ViewController", bundle: nil)
            break;
        case 3:
            viewController = MAGExercise3ViewController(nibName: "MAGExercise3ViewController", bundle: nil)
            break;
        case 4:
            viewController = MAGExercise4ViewController(nibName: "MAGExercise4ViewController", bundle: nil)
            break;
        case 5:
            viewController = MAGExercise5ViewController(nibName: "MAGExercise5ViewController", bundle: nil)
            break;
        case 6:
            viewController = MAGExercise6ViewController(nibName: "MAGExercise6ViewController", bundle: nil)
            break;
        case 7:
            viewController = MAGExercise7ViewController(nibName: "MAGExercise7ViewController", bundle: nil)
            break;
        case 8:
            viewController = MAGExercise8ViewController(nibName: "MAGExercise8ViewController", bundle: nil)
            break;
        case 9:
            viewController = MAGExercise9ViewController(nibName: "MAGExercise9ViewController", bundle: nil)
            break;
        case 10:
            viewController = MAGExercise10ViewController(nibName: "MAGExercise10ViewController", bundle: nil)
            break;
        default:
            break;
        }
        
        guard viewController != nil else { return }
        
        var navigationController = navigationDrawerController?.rootViewController as! UINavigationController
        navigationController = navigationDrawerController?.rootViewController as! UINavigationController
        navigationController.pushViewController(viewController!, animated: true)
        navigationDrawerController?.closeRightView()
    }
}

//
//  MAGExercise2ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit
import MASFoundation
import SVProgressHUD


class MAGExercise2ViewController: MAGBaseViewController {

    // MARK: - Properties
    @IBOutlet weak var urlTextField: MAGTextField!
    @IBOutlet weak var resultTextView: MAGTextView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTextField.placeholder = "/team7ex2"
        title = "Exercise 2"
    }
    
    
    // MARK: - IBAction
    
    @objc
    @IBAction func performInvokeAPI(sender: AnyObject) {
        view.endEditing(true)
        print("Invoke API button is clicked")
        
        MAS.getFrom(urlTextField.text!, withParameters: nil, andHeaders: nil, completion: { (response, error) in
            //We have data!
            SVProgressHUD.dismiss()
            print("Products response: \(response!["MASResponseInfoBodyInfoKey"]!) ")
            self.resultTextView.text = response?.debugDescription
        })
    }
    
    @objc
    @IBAction func performLogout(sender: AnyObject) {
        view.endEditing(true)
        print("Logout button is clicked")
        
        
        if (MASUser.current() != nil) {
            if (MASUser.current()!.isAuthenticated) {
                MASUser.current()?.logout(false, completion: { (completed, error) in    //updated logout function
                    
                    if (error != nil) {
                        print("Error trying to logout the user")
                        //Present an Alert showing the results
                        let alertController = UIAlertController(title: "Error", message: "The user coudl not be logged out", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    } else {
                        print("User logout was successful")
                        //Present an Alert showing the results
                        let alertController = UIAlertController(title: "User Logout", message: "The user has been logged out!", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                })
            } else {
                print ("Trying to logout but user was not authenticated")
            }
        }
    }
}


extension MAGExercise2ViewController {
    
    @objc
    @IBAction func clearAllValues(sender: AnyObject) {
        view.endEditing(true)
        urlTextField.text = ""
        resultTextView.text = ""
    }
    
    fileprivate func updateResultTextView(_ result:AnyObject) {
        resultTextView.text = "\(result)"
    }
    
    fileprivate func updateResultTextView(_ result:String) {
        resultTextView.text = result
    }
}

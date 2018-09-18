//
//  MAGExercise1ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Team 7 on 2018-08-18.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit
import Material
import MASFoundation
import SVProgressHUD
import SwiftyJSON


class MAGExercise1ViewController: MAGBaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var usernameTextField: MAGTextField!
    @IBOutlet weak var passwordTextField: MAGTextField!
    @IBOutlet weak var resultTextView: MAGTextView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.placeholder = "Enter PMFKey"
        passwordTextField.placeholder = "Enter Password"
        
        title = "Exercise 1"
        
//        //Start MAS
//        MAS.setGrantFlow(MASGrantFlow.password)
//        MAS.start(withDefaultConfiguration: true) { (completed, error) in
//            SVProgressHUD.show(withStatus: "Starting MAS")
//            print ("...Starting MAS!")
//            if (completed == true) {
//                SVProgressHUD.dismiss()
//                print ("MAS start completed!")
//            } else {
//                SVProgressHUD.dismiss()
//                print ("MAS   NOT   STARTED.  Errors: ")
//                print (error!)
//            }
//        }
    }
    
    
    // MARK: - IBAction
    
    @objc
    @IBAction func performLogin(sender: AnyObject) {
        view.endEditing(true)
        print("Login button is clicked")
        
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        SVProgressHUD.show(withStatus: "Performing Login")
        
        //Try Login
        MASUser.login(withUserName: username, password: password) { (completed, error) in
            print ("...Starting Login as: \(username)...")
            
            //Login worked
            if (completed == true) {
                SVProgressHUD.dismiss()
                print ("MAS Login Successful!")
                self.resultTextView.text = "User \(username) successfully logged in!"
            } else {
                SVProgressHUD.dismiss()
                print ("MAS Login NOT successful.  Errors: ")
                print (error!)
            }
        }
    }
    
    
    @objc
    @IBAction func performLogout(sender: AnyObject) {
        view.endEditing(true)
        print("Logout button is clicked")
        
        if (MASUser.current() != nil) {
            if (MASUser.current()!.isAuthenticated) {
                MASUser.current()?.logout(false, completion: { (completed, error) in
                    
                    if (error != nil) {
                        print("Error trying to logout the user")
                        //Present an Alert showing the results
                        let alertController = UIAlertController(title: "Error", message: "The user could not be logged out", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                        self.resultTextView.text = "Error logging out!"
                    } else {
                        print("User logout was successful")
                        //Present an Alert showing the results
                        let alertController = UIAlertController(title: "User Logout", message: "The user has been logged out!", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                        self.resultTextView.text = "User logged out!"
                    }
                })
            }
        }
    }
}


extension MAGExercise1ViewController {
    
    @objc
    @IBAction func clearAllValues(sender: AnyObject) {
        view.endEditing(true)
        usernameTextField.text = ""
        passwordTextField.text = ""
        resultTextView.text = ""
    }
    
    fileprivate func updateResultTextView(_ result:AnyObject) {
        resultTextView.text = "\(result)"
    }
    
    fileprivate func updateResultTextView(_ result:String) {
        resultTextView.text = result
    }
}


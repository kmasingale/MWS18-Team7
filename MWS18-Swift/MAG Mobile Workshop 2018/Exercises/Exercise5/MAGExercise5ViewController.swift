//
//  MAGExercise5ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit

class MAGExercise5ViewController: MAGBaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var urlTextField: MAGTextField!
    @IBOutlet weak var resultTextView: MAGTextView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Exercise 5"
        urlTextField.placeholder = "Enter URL path or full URL of API"
    }
    
    
    // MARK: - IBAction
    
    @objc
    @IBAction func checkCurrentUserSession(sender: AnyObject) {
        view.endEditing(true)
        print("Check current user session button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #5 - Single Sign-On Between Apps
        //
        //  In this exercise, with already authenticated user, you want to validate SSO.
        //  You will need to launch another scheme of the application on the top left corner, and perform this button in the same exercise on the other app.
        //  To validate if SSO was correctly configured, you can simply dump currently authenticated user object without performing any authentication on the other app.
        //  Use [self updateResultTextView:] method to display the authenticated user's information
        //
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#one-time-password
        //
    }
    
    
    @objc
    @IBAction func performInvokeAPI(sender: AnyObject) {
        view.endEditing(true)
        print("Invoke API button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #5 - Single Sign-On Between Apps
        //
        //  Another way to validate if SSO is correctly working, you can simply invoke an protected API that you created, and protected by OAuth/Mutual SSL.
        //
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#build-request-with-masrequestbuilder-and-masrequest
        //
    }
}


extension MAGExercise5ViewController {
    
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

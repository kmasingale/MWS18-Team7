//
//  MAGExercise2ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit

class MAGExercise2ViewController: MAGBaseViewController {

    // MARK: - Properties
    @IBOutlet weak var urlTextField: MAGTextField!
    @IBOutlet weak var resultTextView: MAGTextView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTextField.placeholder = "Enter URL path or full URL of API"
        title = "Exercise 2"
    }
    
    
    // MARK: - IBAction
    
    @objc
    @IBAction func performInvokeAPI(sender: AnyObject) {
        view.endEditing(true)
        print("Invoke API button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #2 - Protect an API with OAuth 2.0
        //
        //  In here, this method gets called when the "Invoke API" button is clicked, and you want to implement API invoke through MASFoundation
        //  which will trigger user authentication through MASUI.
        //  You can invoke endpoint you created which is protected by OAuth
        //
        //  Within completion block of user login, you may want to display the result with following code:
        //  [self updateResultTextView:]
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#user-login-dialog
        //  and http://mas.ca.com/docs/ios/latest/guides/#build-request-with-masrequestbuilder-and-masrequest
        //
    }
    
    @objc
    @IBAction func performLogout(sender: AnyObject) {
        view.endEditing(true)
        print("Logout button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #2 - Protect an API with OAuth 2.0
        //
        //  In here, this method gets called when the "Logout" button is clicked, and you want to implement logout functionality of currently authenticated user through MASFoundation.
        //  Within completion block of user logout, you may want to display the result with following code:
        //  [self updateResultTextView:]
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#login-with-user-credentials
        //
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

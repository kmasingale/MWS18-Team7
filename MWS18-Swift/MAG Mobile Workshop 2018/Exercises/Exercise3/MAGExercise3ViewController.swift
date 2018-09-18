//
//  MAGExercise3ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit

class MAGExercise3ViewController: MAGBaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var urlTextField: MAGTextField!
    @IBOutlet weak var resultTextView: MAGTextView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Exercise 3"
        urlTextField.placeholder = "Enter URL path or full URL of API"
    }
    
    
    // MARK: - IBAction
    
    @objc
    @IBAction func performInvokeAPI(sender: AnyObject) {
        view.endEditing(true)
        print("Invoke API button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #3 - Protect an API with OAuth 2.0
        //
        //  In here, this method gets called when the "Invoke API" button is clicked, and you want to implement API invoke through MASFoundation
        //  which will trigger user authentication in this time, with implicit authentication.
        //  You can invoke endpoint you created which is protected by OAuth / Mutual SSL
        //
        //  Within completion block of API invoke, you may want to display the result with following code:
        //  [self updateResultTextView:]
        //
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#masgrantflowpassword
        //  and http://mas.ca.com/docs/ios/latest/guides/#build-request-with-masrequestbuilder-and-masrequest
        //
    }
    
    @objc
    @IBAction func performLogout(sender: AnyObject) {
        view.endEditing(true)
        print("Logout button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #3 - Protect API with OAuth 2.0 and Mutual SSL
        //
        //  In here, this method gets called when the "Logout" button is clicked, and you want to implement logout functionality of currently authenticated user through MASFoundation.
        //  Within completion block of user logout, you may want to display the result with following code:
        //  [self updateResultTextView:]
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#login-with-user-credentials
        //
    }
}


extension MAGExercise3ViewController {
    
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

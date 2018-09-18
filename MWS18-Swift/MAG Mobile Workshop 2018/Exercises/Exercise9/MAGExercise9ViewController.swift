//
//  MAGExercise9ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit

class MAGExercise9ViewController: MAGBaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var urlTextField: MAGTextField!
    @IBOutlet weak var resultTextView: MAGTextView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Exercise 9"
        urlTextField.placeholder = "https://api.ipify.org?format=json"
    }
    
    
    // MARK: - IBAction
    
    @objc
    @IBAction func performInvokePublicAPI(sender: AnyObject) {
        view.endEditing(true)
        print("Invoke public API button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #9 - Consume a Public API
        //
        //  In this exercise, you want to test functionality to invoke public API on another server other than our own Gateway.
        //  In order to do this, you will need to go through few steps to prepare and obtain some information of the other servers to allow MASFoundation
        //  to communicate to that particular server.
        //
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#send-http-requests-to-external-apis
        //  https://www.ca.com/en/blog-developers/how-to-make-secure-calls-to-apis-from-external-servers.html
        //  and http://mas.ca.com/docs/ios/latest/guides/#build-request-with-masrequestbuilder-and-masrequest
        //
    }
}


extension MAGExercise9ViewController {
    
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


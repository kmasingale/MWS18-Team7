//
//  MAGExercise6ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit

class MAGExercise6ViewController: MAGBaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var urlTextField: MAGTextField!
    @IBOutlet weak var resultTextView: MAGTextView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Exercise 6"
        urlTextField.placeholder = "Enter URL path or full URL of API"
    }
    
    
    // MARK: - IBAction
    
    @objc
    @IBAction func performSessionLock(sender: AnyObject) {
        view.endEditing(true)
        print("Lock session button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #6 - Fingerprint Device Lock/Unlock Session
        //
        //  In this exercise, with already authenticated user, you want to validate Session Lock functionality.
        //  You will need to implement user session lock functionality in this method.
        //
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#fingerprint-sessions-lock
        //
    }
    
    
    @objc
    @IBAction func performSessionUnlock(sender: AnyObject) {
        view.endEditing(true)
        print("Unlock session button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #6 - Fingerprint Device Lock/Unlock Session
        //
        //  In this exercise, with already authenticated user, you want to validate Session Lock functionality.
        //  You will need to implement user session unlock functionality in this method.
        //
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#fingerprint-sessions-lock
        //
    }
    
    
    @objc
    @IBAction func performInvokeAPI(sender: AnyObject) {
        view.endEditing(true)
        print("Invoke API button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #6 - Fingerprint Device Lock/Unlock Session
        //
        //  In this exercise, with already authenticated user, you want to validate Session Lock functionality.
        //  To validate session lock, you may want to implement to API invoke in this method.
        //  If the user session is locked, MASFoundation will return an error saying that the user's session is currently locked,
        //  if the user session is properly unlocked, MASFoundation will proceed with API request.
        //
        //  You can use any API, or the one that you created in previous exercises to validate it.
        //
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#fingerprint-sessions-lock
        //  and http://mas.ca.com/docs/ios/latest/guides/#build-request-with-masrequestbuilder-and-masrequest
        //
    }
}


extension MAGExercise6ViewController {
    
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

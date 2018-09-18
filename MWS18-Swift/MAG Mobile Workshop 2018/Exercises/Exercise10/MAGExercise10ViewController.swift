//
//  MAGExercise10ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit

class MAGExercise10ViewController: MAGBaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var urlTextField: MAGTextField!
    @IBOutlet weak var resultTextView: MAGTextView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Exercise 10"
        urlTextField.placeholder = "Enter URL path or full URL of geo-fencing API"
    }
    
    
    // MARK: - IBAction
    
    @objc
    @IBAction func performInvokeGeoFencingAPI(sender: AnyObject) {
        view.endEditing(true)
        print("Invoke geo-fencing API button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #10 - Protect an API with Geofencing
        //
        //  In this exercise, you want to test functionality to invoke an API that is protected by MAG's geofencing functionality
        //
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#geolocation
        //
    }
}


extension MAGExercise10ViewController {
    
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

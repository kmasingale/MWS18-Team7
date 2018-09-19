//
//  MAGExercise9ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit
import MASFoundation
import SVProgressHUD
import SwiftyJSON
import MASUI

class MAGExercise9ViewController: MAGBaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var urlTextField: MAGTextField!
    @IBOutlet weak var resultTextView: MAGTextView!
    let urlString = "https://api.ipify.org:443?format=json"
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Exercise 9"
        urlTextField.text = urlString
    }
    
    
    // MARK: - IBAction
    
    @objc
    @IBAction func performInvokePublicAPI(sender: AnyObject) {
        view.endEditing(true)
        print("Invoke public API button is clicked")

        // Create a URL from string with schema, target host and port
        let url = URL.init(string: urlString)
        
        // Configure security settings for the target host
        let securityConfiguration = MASSecurityConfiguration.init(url: url!)
        securityConfiguration.isPublic = true
        securityConfiguration.publicKeyHashes = ["gAZLWmiY0ORGxqG0ccEhqiB3baugOOs9vdcezRCHc44="]
        
        do {
            try MASConfiguration.setSecurity(securityConfiguration, error: ())
            print ("MAS setSecurity was successful")
        } catch {
             print ("Caught error with setSecurity config")
        }
        
        MAS.getFrom(urlString, withParameters: nil, andHeaders: nil, completion: { (response, error) in
            
            if (error == nil) {
                
                //We have data!
                SVProgressHUD.dismiss()
                print("Response: \(response!["MASResponseInfoBodyInfoKey"]!) ")
                
                //Parse JSON
                print("Try to parse JSON...")
                let resultJSON : JSON = JSON(response!["MASResponseInfoBodyInfoKey"]!)
                let ip = resultJSON["ip"].stringValue
                
                let data = ("ip is: \(ip)")
                print (data)
                self.resultTextView.text = data
                
                //self.resultTextView.text = response?.debugDescription
                
            } else {
                print ("Error \(error!)")
            }
        })
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


//
//  MAGExercise5ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit
import MASFoundation
import SVProgressHUD
import SwiftyJSON

class MAGExercise5ViewController: MAGBaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var urlTextField: MAGTextField!
    @IBOutlet weak var resultTextView: MAGTextView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTextField.text = "/mws-team7/exercise2"
        title = "Exercise 5"
        urlTextField.placeholder = "Enter URL path or full URL of API"
    }
    
    
    // MARK: - IBAction
    
    @objc
    @IBAction func checkCurrentUserSession(sender: AnyObject) {
        view.endEditing(true)
        print("Check current user session button is clicked")
        
        if (MASUser.current() != nil) {
            self.resultTextView.text = "\(String(describing: MASUser.current()))"
        }
        else {
            self.resultTextView.text = "User has not been Authenticated!\n \nPlease Authenticate in either APP before selecting this option."
        }
        
    }
    
    
    @objc
    @IBAction func performInvokeAPI(sender: AnyObject) {
        view.endEditing(true)
        print("Invoke API button is clicked")
        
        MAS.getFrom(urlTextField.text!, withParameters: nil, andHeaders: nil, completion: { (response, error) in
            
            if (error == nil) {
                //We have data!
                SVProgressHUD.dismiss()
                print("Products response: \(response!["MASResponseInfoBodyInfoKey"]!) ")
                
                //Parse JSON
                print("Try to parse JSON...")
                let resultJSON : JSON = JSON(response!["MASResponseInfoBodyInfoKey"]!)
                let name = resultJSON["name"].stringValue
                let time = resultJSON["time"].stringValue
                //let message = resultJSON["message"].stringValue
                
                let data = ("Message: Hello from Exercise 7 \nName: \(name) \nTime: \(time)")
                
                print (data)
                self.resultTextView.text = data
                //self.resultTextView.text = "\(data) \n\(MASUser())"
                
                
                //self.resultTextView.text = response?.debugDescription
            } else {
                print ("Error \(error!)")
            }
            
        })
        
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

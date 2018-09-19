//
//  MAGExercise6ViewController.swift
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


class MAGExercise6ViewController: MAGBaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var urlTextField: MAGTextField!
    @IBOutlet weak var resultTextView: MAGTextView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Exercise 6"
        urlTextField.text = "/mws-team7/exercise3"
    }
    
    
    // MARK: - IBAction
    
    @objc
    @IBAction func performSessionLock(sender: AnyObject) {
        view.endEditing(true)
        print("Lock session button is clicked")
        
        //
        // Only lock the session when [MASUser currentUser] exists, and is authenticated
        //
        if MASUser.current() != nil && (MASUser.current()?.isAuthenticated)! {
            MASUser.current()?.lockSession(completion: { (completed, error) in
                if completed == true {
                    // session lock successful
                    print ("Session locked")
                }
                else {
                    // session lock error
                    print ("Session NOT locked, but requested")
                }
            })
        } else {
            print ("Session NOT locked, possibly not authenticated.")
        }
    }
    
    
    @objc
    @IBAction func performSessionUnlock(sender: AnyObject) {
        view.endEditing(true)
        print("Unlock session button is clicked")
        
        //
        // Unlock the user's session when [MASUser currentUser] exists, and session is locked
        //
        if MASUser.current() != nil && (MASUser.current()?.isSessionLocked)! {

            // Unlock the session with operation prompt message
            // (optionally, also can be unlocked without the message)
            MASUser.current()?.unlockSession(completion: { (completed, error) in
                if completed {
                    // session unlock successful
                    print ("Session unlock was successful")
                }
                else {
                    // session unlock failure
                    print ("Session unlock was NOT successful")
                }
            })
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
                let message = resultJSON["message"].stringValue
                
                let data = ("Message: \(message) \nName: \(name) \nTime: \(time)")
                print (data)
                self.resultTextView.text = data
                
                //self.resultTextView.text = response?.debugDescription
                
            } else {
                print ("Error \(error!)")
            }
        })

            
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

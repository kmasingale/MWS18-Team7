//
//  MAGExercise4ViewController.swift
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

class MAGExercise4ViewController: MAGBaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var urlTextField: MAGTextField!
    @IBOutlet weak var resultTextView: MAGTextView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Exercise 4"
        urlTextField.text = "/mws-team7/exercise4?amount=50"
        
        
        //
        // Configure to handle OTP by custom UI if MASUI library is included
        // Place this line of code in AppDelegate or in your app's initialization
        //
        MAS.setWillHandleAuthentication(true)
        
        //
        // OTP Channel selection block is invoked when SDK needs
        //
        MAS.setOTPChannelSelectionBlock { (supportedOTPChannels, otpGenerationBlock) in
            //
            // Select the channel
            //
            let selectedChannel = supportedOTPChannels[0]
            otpGenerationBlock([selectedChannel], false, { (completed, error) in
                //
                // Handle result of channel selection
                //
            })
        }
        
        
        //
        // OTP credential block is invoked when SDK needs
        //
        MAS.setOTPCredentialsBlock { (otpBlock, error) in

            // Create UI to retrieve OTP credential from the user
            let otpCredentials = "...user input..."
            
            otpBlock(otpCredentials, false, {(completed, error) in
                
                //
                // Handle result of OTP credential
                //
            })
        }

        
    }

    
    // MARK: - IBAction
    
    @objc
    @IBAction func performInvokeAPIWithOTP(sender: AnyObject) {
        view.endEditing(true)
        print("Invoke API with OTP button is clicked")
        
        //var TODO__: AnyObject
        //
        //  TODO: Exercise #4 - Multifactor Authentication with OTP
        //
        //  In here, this method gets called when the "Invoke API with OTP" button is clicked, and you want to implement API invoke through MASFoundation
        //  which will invoke API you created, and protected by OTP.
        //
        //  For One Time Password, you may want to use MASUI.framework to avoid extra time to implement OTP screen.
        //
        //  Within completion block of API invoke, you may want to display the result with following code:
        //  [self updateResultTextView:]
        //
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#one-time-password
        //  and http://mas.ca.com/docs/ios/latest/guides/#build-request-with-masrequestbuilder-and-masrequest
        //
        
        MAS.getFrom(urlTextField.text!, withParameters: nil, andHeaders: nil, completion: { (response, error) in
            
            if (error == nil) {
                
                //We have data!
                SVProgressHUD.dismiss()
                print("Products response: \(response!["MASResponseInfoBodyInfoKey"]!) ")
                
                //Parse JSON
                print("Try to parse JSON...")
                let resultJSON : JSON = JSON(response!["MASResponseInfoBodyInfoKey"]!)
                let message = resultJSON["message"].stringValue
                let amount = resultJSON["amount"].stringValue
                
                let data = ("Message: \(message) \nAmount: \(amount) ")
                print (data)
                self.resultTextView.text = data
                
                //self.resultTextView.text = response?.debugDescription
                
            } else {
                print ("Error \(error!)")
            }
        })
        
    }
}

extension MAGExercise4ViewController {
    
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

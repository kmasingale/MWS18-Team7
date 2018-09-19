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
        
        //
        // Create a URL from string with schema, target host and port
        //
        var url = URL.init(string: "https://api.ipify.org:443?format=json")
        
        //
        // Configure security settings for the target host
        //
        var securityConfiguration = MASSecurityConfiguration.init(url: url!)
        securityConfiguration.isPublic = true
        
        securityConfiguration.certificates = ["-----BEGIN CERTIFICATE-----MIIFSTCCBDGgAwIBAgIRAJIP0bf+S4iutu1asMNsVmgwDQYJKoZIhvcNAQELBQAwgZAxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMTYwNAYDVQQDEy1DT01PRE8gUlNBIERvbWFpbiBWYWxpZGF0aW9uIFNlY3VyZSBTZXJ2ZXIgQ0EwHhcNMTgwMTI0MDAwMDAwWhcNMjEwMTIzMjM1OTU5WjBYMSEwHwYDVQQLExhEb21haW4gQ29udHJvbCBWYWxpZGF0ZWQxHTAbBgNVBAsTFFBvc2l0aXZlU1NMIFdpbGRjYXJkMRQwEgYDVQQDDAsqLmlwaWZ5Lm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMCdCYpCtwGoVFah51Gy/ZrgPmk8s2JTBMZlnKGnLKP7r1SCfeRHgmcGYiAMtXwfFWnA3ZGQ6L9Gm00T1G0K/FpS2POxtDNfRWLiOFS80hW0UnXrXCvnyHVK0+pXs/3CuOqj8iSnMPdZsly/hIt0zaWM8zRB8789RIr+zRmlFuXzJQTYvul/SKVPZ8gW6HwblTAWL+xZ5KRof8yiokR2WZtl21NQ+Ox9/JnpNMPlCTgHeKRXhAR1zEg2Hn1FGshS5ypAa0O+8QgsheKzYWdq4bcEJRcYMXQg0S6eBB8GLsj1tqOKVYmk1S9lcbS4vjzBGh5rhER6IuMTqstChP8WncCAwEAAaOCAdMwggHPMB8GA1UdIwQYMBaAFJCvajqUWgvYkOoSVnPfQ7Q6KNrnMB0GA1UdDgQWBBQcEDPSTQdru56uAXGhYiQn+yPvczAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/wADAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwTwYDVR0gBEgwRjA6BgsrBgEEAbIxAQICBzArMCkGCCsGAQUFBwIBFh1odHRwczovL3NlY3VyZS5jb21vZG8uY29tL0NQUzAIBgZngQwBAgEwVAYDVR0fBE0wSzBJoEegRYZDaHR0cDovL2NybC5jb21vZG9jYS5jb20vQ09NT0RPUlNBRG9tYWluVmFsaWRhdGlvblNlY3VyZVNlcnZlckNBLmNybDCBhQYIKwYBBQUHAQEEeTB3ME8GCCsGAQUFBzAChkNodHRwOi8vY3J0LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FEb21haW5WYWxpZGF0aW9uU2VjdXJlU2VydmVyQ0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wIQYDVR0RBBowGIILKi5pcGlmeS5vcmeCCWlwaWZ5Lm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAjPOZMqwt7PZErXI5LXmGM2VfScatgpfZncJYRBgbKjtrI2HBt7446pjHXqzpImxC8rGjs3AS15vxIz11ERiHqCskEQbg/0AYKJ1TNr5KrL/K8RY9vtGL1WDQCxMqSZcocvYrYIVam8YkTitO9+xD0K0Icyvgans60Z4nkWJG+ZqRZgNi6TDbfBHWeSiTOc2q4MxIlFXfP8/nyE2Jz/SO2JPatL05Q3VVJBOHtdpm070tZpIWFYXo9fV7xzHHx4WLHdHm/ajStwWJoAGPWFUdmG+xoBqzuhADJRGA9L8DjLleBb6mIM39wKvQqgBSTvZlSiUv4HUHfqpgGH4HX+1Sag==-----END CERTIFICATE-----"]
        securityConfiguration.publicKeyHashes = ["gAZLWmiY0ORGxqG0ccEhqiB3baugOOs9vdcezRCHc44="]
        
        var error:Error
        //MASConfiguration.setSecurity(securityConfiguration, error: error)
        //MASConfiguration.setSecurity(<#T##securityConfiguration: MASSecurityConfiguration##MASSecurityConfiguration#>, error: <#T##()#>)
//        if (error != nil)
//        {
//            // check for an error
//        }
//        else
//        {
//            //security configuration is successfully set
//        }

        
        
        
        
        
        
        //var TODO__: AnyObject
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


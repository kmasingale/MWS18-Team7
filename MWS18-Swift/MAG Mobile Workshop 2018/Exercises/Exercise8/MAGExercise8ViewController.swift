//
//  MAGExercise8ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit

class MAGExercise8ViewController: MAGBaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var resultTextView: MAGTextView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - IBAction
    
    @objc
    @IBAction func performQRCodeScan(sender: AnyObject) {
        view.endEditing(true)
        print("QR Code Scan button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #8 - Proximity Login with QR Code Scanning
        //
        //  In this exercise, you will use a QR Code to transfer the user session from the mobile device to the browser
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#quick-response-code-qr-code
        //
    }

}


extension MAGExercise8ViewController {
    
    @objc
    @IBAction func clearAllValues(sender: AnyObject) {
        view.endEditing(true)
        resultTextView.text = ""
    }
    
    fileprivate func updateResultTextView(_ result:AnyObject) {
        resultTextView.text = "\(result)"
    }
    
    fileprivate func updateResultTextView(_ result:String) {
        resultTextView.text = result
    }
}

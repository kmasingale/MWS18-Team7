//
//  MAGExercise8ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit
import MASFoundation

class MAGExercise8ViewController: MAGBaseViewController {

    var scannedCode:String?
    
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
        
        // view to scan the QRCode
        let scanViewController = QRCodeScannerViewController()
        
        // print decoded value on completion
        scanViewController.completionHandler = { code in
            
            if code.isEmpty == false {
                MASProximityLoginQRCode.authorizeAuthenticateUrl(code, completion: { (completed, error) in
                    let resultString = "Proximity Login using QRCode completed: \(completed) //  error: \(String(describing: error?.localizedDescription))"
                    self.updateResultTextView(resultString)
                })
            }
            
            //self.updateResultTextView(code)
        }
        
        // launch view to scan the QRCode
        present(scanViewController, animated: true, completion: nil)
        
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

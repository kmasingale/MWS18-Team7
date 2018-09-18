//
//  MAGExercise7ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit

class MAGExercise7ViewController: MAGBaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var usernameTextField: MAGTextField!
    @IBOutlet weak var messageTextField: MAGTextField!
    @IBOutlet weak var resultTextView: MAGTextView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Exercise 7"
        usernameTextField.placeholder = "Recipient's PMFKey"
        messageTextField.placeholder = "Enter the message that you want to send"
    }

    
    // MARK: - IBAction
    
    @objc
    @IBAction func performSendMessage(sender: AnyObject) {
        view.endEditing(true)
        print("Send message button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #7 - Messaging
        //
        //  In this exercise, with already authenticated user, you want to validate messaging functionality available through MASConnecta SDK.
        //  You will need MASConnecta and MASIdentityManagement SDK for this exercise.
        //
        //  You will need to implement user messaging functionality with following step:
        //
        //  1: Using MASIdentityManagement, retrieve the MASUser object with input username field.
        //  2: With retrieved MASUser object, use MASConnecta to send a message to that user.
        //
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#messaging
        //  and http://mas.ca.com/docs/ios/latest/guides/#manage-users
        //
    }
    
    
    @objc
    @IBAction func performStartListeningToMyMessage(sender: AnyObject) {
        view.endEditing(true)
        print("Start listening to my message button is clicked")
        
        var TODO__: AnyObject
        //
        //  TODO: Exercise #7 - Messaging
        //
        //  In this exercise, with already authenticated user, you want to validate messaging functionality available through MASConnecta SDK.
        //  You will need MASConnecta and MASIdentityManagement SDK for this exercise.
        //
        //  You will need to implement functionality to receive/listen to your own message.
        //
        //  Please refer to documentation for more details on this functionality: http://mas.ca.com/docs/ios/latest/guides/#start-listening-to-messages
        //
    }
}


extension MAGExercise7ViewController {
    
    @objc
    @IBAction func clearAllValues(sender: AnyObject) {
        view.endEditing(true)
        usernameTextField.text = ""
        messageTextField.text = ""
        resultTextView.text = ""
    }
    
    fileprivate func updateResultTextView(_ result:AnyObject) {
        resultTextView.text = "\(result)"
    }
    
    fileprivate func updateResultTextView(_ result:String) {
        resultTextView.text = result
    }
}

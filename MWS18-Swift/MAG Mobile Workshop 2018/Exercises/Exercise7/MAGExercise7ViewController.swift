//
//  MAGExercise7ViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Hun Go on 2018-08-14.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit
import MASFoundation
import MASConnecta
import MASIdentityManagement
import MASUI




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
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didReceiveMessageNotification(notification:)),
                                               name: NSNotification.Name(rawValue: MASConnectaMessageReceivedNotification),
                                               object: nil)
    }
    
    
    @objc  func didReceiveMessageNotification(notification: NSNotification){
        //
        //Get the Message Object from the notification
        //
        weak var weakSelf = self
        
        DispatchQueue.main.async(execute: {() -> Void in
            
            let myMessage = notification.userInfo![MASConnectaMessageKey] as? MASMessage
               weakSelf?.resultTextView.text = myMessage?.payloadTypeAsString()
            
        })
        
   }
    
    @objc
    @IBAction func performSendMessage(sender: AnyObject) {
        view.endEditing(true)
        print("Send message button is clicked")
        //var userB = MASUser()
        //var userB = ""
        //Authenticated users have the ability to send messages (Text, Data, Image) to a user
        MASUser.getUserByUserName(usernameTextField.text!, completion: { (user, error) in
            let myUser = MASUser.current()
            let userB:MASUser = user!
            myUser?.sendMessage((self.messageTextField.text as NSObject?)!, to: userB, completion: { (success, error) in
                
                
                print("Message Sent")
                //  print("Message Sent : \(success? "YES" : "NO")\nerror : \(error ?? "" as! Error)")
            })
            // your code here
        })
    }
    
    
    @objc
    @IBAction func performStartListeningToMyMessage(sender: AnyObject) {
        view.endEditing(true)
        print("Start listening to my message button is clicked")
        let myUser = MASUser.current()!
        
        //
        //Listen to Messages sent to my User
        //
        myUser.startListening(toMyMessages: {(success , error)  in
            
            if success {
                
                print("Success subscribing to myUser topic!")
            } else {
                
                print(error?.localizedDescription as Any)
            }
        })
        
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

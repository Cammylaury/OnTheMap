//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by Cameron Laury on 3/18/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var logInWithFacebook: facebookBtn!
    
    var keyboardOnScreen = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if emailTextField.text == nil {
            passwordTextField.isEnabled = false
        }
        
    }
    
    @IBAction func loginAction(_ sender: AnyObject) {
        
        if self.emailTextField.text == "" || self.passwordTextField.text == "" {
            
            // Alert to tell the user they didn't fill in the textfields. I used this from a personal app I am building (my final project for Udacity!)
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            // Go to the mapViewController if the login is sucessful
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "messagesViewController")
            self.present(vc!, animated: true, completion: nil)
        }
    }
    
    // Sign up with Udacity using a web view
    
    @IBAction func signUp(_ sender: AnyObject) {
        
        let url = NSURL(string:"https://www.udacity.com/account/auth#!/signup")
        let safariVC = SFSafariViewController(url: url as! URL)
        present(safariVC, animated: true, completion: nil)
        
    }
    
    // Keyboard Stuff
    
    func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    func unsubscribeToKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    
    }
    
    func keyboardWillShow(_ notification: Notification) {
        
    if !keyboardOnScreen {
    view.frame.origin.y -= getKeyboardHeight(notification: notification as NSNotification)
        
    }
    }
    
    func keyboardWillHide(_ notification: Notification) {
        
        if keyboardOnScreen {
            view.frame.origin.y += getKeyboardHeight(notification: notification as NSNotification)
        }
    }
    
    func keyboardDidShow(_ notification: Notification) {
        
        keyboardOnScreen = true
    }
    
    func keyboardDidHide(_ notification: Notification) {
        
        keyboardOnScreen = false
    }
}

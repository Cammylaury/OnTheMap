//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by Cameron Laury on 3/18/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var logInWithFacebook: facebookBtn!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if emailTextField.text != nil {
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
}

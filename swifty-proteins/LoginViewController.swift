//
//  ViewController.swift
//  swifty-proteins
//
//  Created by Spencer SCHAFER on 2019/01/22.
//  Copyright © 2019 Spencer SCHAFER. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        self.authenticateWithTouchID()
    }
    
    // Hide navigation bar when root view appears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // Show navigation bar when root view disappears
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }

    // Use button to perform segue
    @IBAction func buttonGo(_ sender: Any) {
        authenticateWithTextInput()
    }
    
    // Use return key to perform segue
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        authenticateWithTextInput()
        return true
    }
    
    // Perform authentication with Username and Password instead
    func authenticateWithTextInput() {
        if (usernameTextField.text == "admin" && passwordTextField.text == "admin" ) {
            //Segue to TableViewController
            self.performSegue(withIdentifier: "goButtonSegue", sender: self)
            
            // Clearing text in textfield
            usernameTextField.text = nil
            passwordTextField.text = nil
            
            // Setting cursor to usernameTextField
            usernameTextField.becomeFirstResponder()
        } else {
            self.authenticationFailedAlert()
        }
    }

    // Checking if device can be authenticated using TouchID / FaceID
    func authenticateWithTouchID() {
        let context:LAContext = LAContext()
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            
            // TODO: Check for faceID/touchID here
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Use fingerprint to verify.", reply: { (wasSuccess, error ) in
                
                // If fingerprint was valid, otherwise user will need to use username/password
                if wasSuccess {
                    //Segue to TableViewController
                    self.performSegue(withIdentifier: "goButtonSegue", sender: self)
                }
            })
        } else {
            // Setting cursor to usernameTextField
            usernameTextField.becomeFirstResponder()
        }
    }
    
    func authenticationFailedAlert() {
        // Creating the alert
        let alert = UIAlertController(title: "Incorrect username or password", message: "Please try again.", preferredStyle: .alert)
        
        // Adding option 'OK' to the alert
        alert.addAction(UIAlertAction(title: "OK", style: .default,  handler: { (action) in
            
            // When 'OK' is clicked, the alert is dismissed
            alert.dismiss(animated: true, completion: nil)
        }))
        
        // Presenting the alert
        self.present(alert, animated: true, completion: nil)
    }
}

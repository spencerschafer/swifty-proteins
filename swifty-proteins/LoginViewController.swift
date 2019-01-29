//
//  ViewController.swift
//  swifty-proteins
//
//  Created by Spencer SCHAFER on 2019/01/22.
//  Copyright © 2019 Spencer SCHAFER. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.authenticateWithTouchID()
    }
    
    @IBAction func buttonGo(_ sender: Any) {
        
        // Perform authentication with Username and Password instead
        if (usernameTextField.text == "admin" && passwordTextField.text == "admin" ) {
            print("[Authentication Success]")
            //Segue to TableViewController
            self.performSegue(withIdentifier: "goButtonSegue", sender: self)
        } else {
            print("[Authentication Failed]")
            self.authenticationFailedAlert()
        }
    }
    
    func authenticateWithTouchID() {
        let context:LAContext = LAContext()
        
        // Checking if device can be authenticated using TouchID / FaceID
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            
            // TODO: Possibly check for faceID/touchID here
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Use fingerprint to verify.", reply: { (wasSuccess, error ) in
                
                // If fingerprint was valid
                if wasSuccess {
                    print("[Authentication Success]")
                    //Segue to TableViewController
                }
            })
        }
    }
    
    func authenticationFailedAlert() {
        
        // Creating the alert
        let alert = UIAlertController(title: "Incorrect username or password", message: "Please try again.", preferredStyle: .alert)
        
        // Adding option 'OK' to the alert
        alert.addAction(UIAlertAction(title: "OK", style: .default,  handler: { (action) in
            
            // When 'OK' is clicked, the alert is dismissed
            alert.dismiss(animated: true, completion: nil)
            
            print("[Alert Closed]")
        }))
        
        // Presenting the alert
        self.present(alert, animated: true, completion: nil)
    }
}

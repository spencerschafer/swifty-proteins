//
//  ViewController.swift
//  swifty-proteins
//
//  Created by Spencer SCHAFER on 2019/01/22.
//  Copyright © 2019 Spencer SCHAFER. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        print("[View Controller End]")
        authenticateLogin()
    }
    
    func authenticateLogin() {
        print("[Start of Authentication]")
        let context:LAContext = LAContext()
        
        let auth = LAContext().canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: nil)
        print(auth)
        
        //Checking if device can be authenticated using TouchID
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Login Using TouchID", reply: { (wasSuccess, error ) in
                if wasSuccess {
                    print("[Authentication Success]")
                } else {
                    print("[Authentication Failed]")
                }
            })
        } else {
            print("[Device does not support TouchID]")
        }
    }
}

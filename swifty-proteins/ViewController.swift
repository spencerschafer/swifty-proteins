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
        let context = LAContext()
        print("[Start of Authentication]")
        //Checking if device can be authenticated using TouchID
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "HELLOWORLD", reply: { (success, fail) in
                if (success) {
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

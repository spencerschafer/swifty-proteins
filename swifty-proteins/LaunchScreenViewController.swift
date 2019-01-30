//
//  LaunchScreen.swift
//  swifty-proteins
//
//  Created by Spencer SCHAFER on 2019/01/23.
//  Copyright © 2019 Spencer SCHAFER. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.perform(#selector(LaunchScreenViewController.delayLaunchScreen), with: nil, afterDelay: 0.1)
    }
    
    @objc func delayLaunchScreen() {
        performSegue(withIdentifier: "launchScreenSegue", sender: self)
    }
}

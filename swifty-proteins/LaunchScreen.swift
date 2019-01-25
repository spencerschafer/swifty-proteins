//
//  LaunchScreen.swift
//  swifty-proteins
//
//  Created by Spencer SCHAFER on 2019/01/23.
//  Copyright © 2019 Spencer SCHAFER. All rights reserved.
//

import UIKit

class LaunchScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("[Start]")
        self.perform(#selector(LaunchScreen.delayLaunchScreen), with: nil, afterDelay: 0.1)
        print("[End of Start]")
    }
    
    @objc func delayLaunchScreen() {
        print("[Function Reached]")
        performSegue(withIdentifier: "LaunchScreenSegue", sender: self)
        print("[End of Function]")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

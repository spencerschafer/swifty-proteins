//
//  TableViewController.swift
//  swifty-proteins
//
//  Created by Spencer SCHAFER on 2019/01/28.
//  Copyright © 2019 Spencer SCHAFER. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITabBarDelegate, UISearchBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.test()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

    
    func test(){
        print("Hello")
    }
}

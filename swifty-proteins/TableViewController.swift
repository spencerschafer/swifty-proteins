//
//  TableViewController.swift
//  swifty-proteins
//
//  Created by Spencer SCHAFER on 2019/01/28.
//  Copyright © 2019 Spencer SCHAFER. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var array: [String] = ["1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Ligands";
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let referenceCell =  tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
        
        let label = "[ " + array[indexPath.row] + " ]"
        referenceCell.textLabel?.text = label
        return referenceCell
    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "backButtonSegue", sender: self)
    }
    
}

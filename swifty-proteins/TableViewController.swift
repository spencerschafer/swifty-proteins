//
//  TableViewController.swift
//  swifty-proteins
//
//  Created by Spencer SCHAFER on 2019/01/28.
//  Copyright © 2019 Spencer SCHAFER. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var proteins: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Ligands";
        readTextFile()
    }
    
    func readTextFile() {
        //        let filePath = Bundle.main.path(forResource: "ligands", ofType: "txt")
        let path = Bundle.main.path(forResource: "ligands", ofType: "txt")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: path!) {
            do {
                let text = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
                self.proteins = text.components(separatedBy: "\n")
                print(proteins)
            } catch {
                print("File not found")
            }
        } else {
            print("ligands.txt not found")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return proteins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let referenceCell =  tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
        
        referenceCell.textLabel?.text = proteins[indexPath.row]
        return referenceCell
    }
}

//
//  TableViewController.swift
//  swifty-proteins
//
//  Created by Spencer SCHAFER on 2019/01/28.
//  Copyright © 2019 Spencer SCHAFER. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var proteinSearchBar: UISearchBar!
    @IBOutlet weak var proteinTableView: UITableView!
    var isSearching: Bool = false
    var proteins: [String] = []
    var searchList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Ligands";
        proteinSearchBar.becomeFirstResponder()
        readTextFile()
    }
    
    func readTextFile() {
        // Checking whether path exists first before checking if file exists
        if FileManager.default.fileExists(atPath: Bundle.main.path(forResource: "ligands", ofType: "txt") ?? "" ) {
            do {
                let filePath = Bundle.main.path(forResource: "ligands", ofType: "txt")
                let fileContents = try String(contentsOfFile: filePath!, encoding: String.Encoding.utf8)
                self.proteins = fileContents.components(separatedBy: "\n")
            } catch {
                print("[ Error : TableViewController.readTextFile() ] - Unable to read file.")
                self.readTextFileFailedAlert(title: "Reading Error", message: "Unable to read file.")
            }
        } else {
            print("[ Error : TableViewController.readTextFile() ] - File does not exist.")
            self.readTextFileFailedAlert(title: "File not found", message: "File does not exist.")
        }
    }
    
    func readTextFileFailedAlert(title: String, message: String) {
        // Creating the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Adding option 'OK' to the alert
        alert.addAction(UIAlertAction(title: "OK", style: .default,  handler: { (action) in
            
            // When 'OK' is clicked, the alert is dismissed
            alert.dismiss(animated: true, completion: nil)
        }))
        
        // Presenting the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchList.count
        }
        
        return proteins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let referenceCell =  tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
        
        if isSearching {
            referenceCell.textLabel?.text = searchList[indexPath.row]
        } else {
            referenceCell.textLabel?.text = proteins[indexPath.row]
        }
        return referenceCell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            proteinTableView.reloadData()
        } else {
            isSearching = true
            searchList = proteins.filter({$0.contains((searchBar.text?.uppercased())!)})
            proteinTableView.reloadData()
        }
    }
}

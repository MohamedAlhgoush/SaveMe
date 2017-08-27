//
//  Target.swift
//  Saver
//
//  Created by Mohamed Alghoush  on 8/24/17.
//  Copyright © 2017 Mohamed Alghoush . All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase


class Target: UITableViewController {
    
    var bloodType: String?
    var databasePath: String?
    var currentType: String?
    var type: [String] = []
    var donorArray: [Donors] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference(withPath: databasePath!)
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children {
                let newDonor = Donors(snapshot: child as! DataSnapshot)
                self.donorArray.append(newDonor!)
            }
            self.tableView.reloadData()
        })
        self.title = self.databasePath
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> DonorListTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "donorCell") as! DonorListTableViewCell
        
        cell.textLabel?.text = donorArray[indexPath.row].firstName + "   " + donorArray[indexPath.row].lastName + "  " + donorArray[indexPath.row].email + "  " + donorArray[indexPath.row].mobile
        
//        let fName = fruits[indexPath.row]
      //  cell.label?.text = fName
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donorArray.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goto"{
            let destination = segue.destination as! Table
            let index = tableView.indexPathForSelectedRow?.row
            let selectedType = type[index!]
            destination.currenttype = selectedType
            
        }}
    
}


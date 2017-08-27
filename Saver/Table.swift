//
//  Table.swift
//  Saver
//
//  Created by Mohamed Alghoush  on 8/22/17.
//  Copyright © 2017 Mohamed Alghoush . All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
class Table: UITableViewController{
    
   // var data: Data?
    let AP:[String] = ["","",""]
    let AN:[String] = ["","",""]
    let BP:[String] = ["","",""]
    let BN:[String] = ["","",""]
    let OP:[String] = ["","",""]
    let ON:[String] = ["","",""]
    let ABP:[String] = ["","",""]
    let ABN:[String] = ["","",""]
    var currentty:[String] = []
    var currenttype:String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if currenttype == "O+"{
            currentty = OP
            
        }
        else if currenttype == "O-"{
            currentty = ON
            
        }
        else if currenttype == "B+"{
            currentty = BP
            
        }
        else if currenttype == "B-"{
            currentty = BN
            
        }
        else if currenttype == "A+"{
            currentty = AP
            
        }
        else if currenttype == "A-"{
            currentty = AN
            
            
        }
        else if currenttype == "AB+"{
            currentty = ABP
            
            
        }
        else if currenttype == "AB-"{
            currentty = ABN
            
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gotable", for: indexPath)
        cell.textLabel?.text = currentty[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentty.count
    }
    
}

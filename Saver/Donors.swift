//
//  Donors.swift
//  Saver
//
//  Created by Mohamed Alghoush  on 8/24/17.
//  Copyright © 2017 Mohamed Alghoush . All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class Donors {
    
    // MARK: - Properties
    
    let uid: String
    let firstName: String
    let lastName: String
    let email: String
    let mobile: String
    let bloodType: String
    // MARK: - Init
    
    init(uid: String, firstName: String, lastName: String, email: String, mobile: String, bloodType: String) {
        self.uid = uid
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.mobile = mobile
        self.bloodType = bloodType
    }
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let firstName = dict["firstName"] as? String,
            let lastName = dict["lastName"] as? String,
            let email = dict["email"] as? String,
            let mobile = dict["mobile"] as? String,
            let bloodType = dict["bloodType"] as? String
            else { return nil }
    
        self.uid = snapshot.key
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.mobile = mobile
        self.bloodType = bloodType
    }
    // MARK: - Singleton
    
    // 1
    private static var _current: Donors?
    
    // 2
    static var current: Donors {
        // 3
        guard let currentDonors = _current else {
            fatalError("Error: current donors doesn't exist")
        }
        
        // 4
        return currentDonors
    }
    
    // MARK: - Class Methods
    
    // 5
    static func setCurrent(_ donors: Donors) {
        _current = donors
    }
}

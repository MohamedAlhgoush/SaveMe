//
//  Donor service.swift
//  Saver
//
//  Created by Mohamed Alghoush  on 8/24/17.
//  Copyright © 2017 Mohamed Alghoush . All rights reserved.
//

import Foundation

    import FirebaseAuth.FIRUser
    import FirebaseDatabase
    
    struct DonorService {
        static func create(_ firstName: String, lastName: String, email: String, mobile: String, bloodType: String, completion: @escaping (Donors?) -> Void) {
            let donorAttrs = ["firstName": firstName,"lastName": lastName, "email": email, "mobile": mobile , "bloodType": bloodType]
            
            let ref = Database.database().reference().child(bloodType).child(firstName+lastName) // TODO: change  this
            ref.setValue(donorAttrs) { (error, ref) in
                if let error = error {
                    assertionFailure(error.localizedDescription)
                    return completion(nil)
                }
                
                ref.observeSingleEvent(of: .value, with: { (snapshot) in
                    let donors = Donors(snapshot: snapshot)
                    completion(donors)
                })
            }
        }
    }


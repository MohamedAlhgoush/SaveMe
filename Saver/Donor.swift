//
//  Giver.swift
//  Saver
//
//  Created by Mohamed Alghoush  on 8/22/17.
//  Copyright © 2017 Mohamed Alghoush . All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase



//struct Data {}
class Donor: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerData: [String] = [String]()
    
    @IBOutlet weak var FirstTextField: UITextField!
    @IBOutlet weak var LastTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!

    @IBOutlet weak var MobileTextField: UITextField!
    @IBOutlet weak var Picker: UIPickerView!
    
    

    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.Picker.delegate = self
        self.Picker.dataSource = self
        
        // Input data into the Array:
        pickerData = ["A+", "A-", "B+", "B-", "O+", "O-","AB+","AB-"]
    }
    
    @IBAction func Submit(_ sender: UIButton) {
       
        }
        
    
  //  }
    
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "backToDonorHome") {
//            let svc = segue.destination as! Basic
            let bloodType = pickerData[self.Picker.selectedRow(inComponent: 0)]
//            svc.bloodType = bloodType

            if self.FirstTextField.text != "" && self.LastTextField.text != "" && self.EmailTextField.text != "" && self.MobileTextField.text != "" {
                DonorService.create(self.FirstTextField.text!, lastName: self.LastTextField.text!, email: self.EmailTextField.text!, mobile: self.MobileTextField.text!, bloodType: bloodType, completion: { (Donors) in

                })
            }

//            svc.databasePath = bloodType
        }
    }
}





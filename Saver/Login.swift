//
//  ViewController.swift
//  Saver
//
//  Created by Mohamed Alghoush  on 8/22/17.
//  Copyright © 2017 Mohamed Alghoush . All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI


class Login: UIViewController {
   
    @IBOutlet weak var Loginemail: UITextField!
    
    @IBOutlet weak var LoginPassword: UITextField!
    
    @IBAction func Login(_ sender: Any) {
        
        if self.Loginemail.text == "" || self.LoginPassword.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().signIn(withEmail: self.Loginemail.text!, password: self.LoginPassword.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful
//                    self.performSegue(withIdentifier: "Login", sender: self)
                    
                    
                } else {
                    
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


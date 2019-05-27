//
//  RegisterViewController.swift
//  UngService27May19
//
//  Created by MasterUNG on 27/5/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let nameSegue: String = "BackAuthen"
    
    var name: String?
    var user: String?
    var password:String?
    
    
    
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }   // Main Method
    
    
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        
        print("You Click Back")
        performSegue(withIdentifier: nameSegue, sender: self)
        
    }
    
    
    
    @IBAction func uploadButton(_ sender: UIBarButtonItem) {
        
        var nameString: String = ""
        var userString: String = ""
        var passwordString: String = ""
        
        
        
        
        name = nameTextField.text
        print("name = \(name)")
        
        if let testName = name {
            print("testName = \(testName)")
            nameString = testName
        }
        
        user = userTextField.text
        if let testName = user {
            userString = testName
            print("userString = \(userString)")
        }
        
        password = passwordTextField.text
        if let testPassword = password {
            passwordString = testPassword
            print("password = \(passwordString)")
        }
        
//        Check Space
        if (nameString.count == 0) {
            print("Name is space")
        }   else if (userString.count == 0) {
            print("User is Space")
        } else if (passwordString.count == 0) {
            print("Passwrord is space")
        }
        
    }   // uploadButton
    

}   // Main Class

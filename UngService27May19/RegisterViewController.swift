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
//        print("name = \(name)")
        
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
            myAlert(message: "กรุณา กรอก ชื่อด้วยคะ")
        }   else if (userString.count == 0) {
            print("User is Space")
            myAlert(message: "กรุณา กรอก User คะ")
        } else if (passwordString.count == 0) {
            print("Passwrord is space")
            myAlert(message: "Please Fill Password in Blank")
        } else if (passwordString.count <= 5) {
            myAlert(message: "Password more 6 Charactor")
        } else {
            
//            Upload To mySQL Server
            uploadToServer(name: nameString, user: userString, password: passwordString)
            
            
        }
        
    }   // uploadButton
    
    
    func uploadToServer(name: String, user: String, password: String) -> Void {
        
        let urlString: String = "https://www.androidthai.in.th/wit/addUserMaster.php?isAdd=true&Name=\(name)&User=\(user)&Password=\(password)"
        
        let objURL = URL(string: urlString) // แบ้นบาส
        let request = NSMutableURLRequest(url: objURL!)    // ความพยายามที่อยากให้ทำ
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            if error != nil {
                print("Have Error")
            } else {
                
//                Task ทำงานสำเร็จ
                if let testData = data {
                    
                    let canReadable = NSString(data: testData, encoding: String.Encoding.utf8.rawValue)
                    print("canReadable ==> \(canReadable)")
                    
                    if let testCanReadable = canReadable {
                        
                        if testCanReadable == "true" {
                            
                            DispatchQueue.main.async {
                                self.performSegue(withIdentifier: "BackAuthen", sender: self)
                            }
                            
                        } // if4
                        
                    }   // if3
                    
                }   // if2
                
            }   // if1
            
            
        } // End Task
        task.resume()
        
        
        
        
        
        
        
        
    }   // uploadToServer
    
    
    
    
    func myAlert(message: String) -> Void {
        
        let objAlertDialog = UIAlertController(title: "มี Error เกิดขึ้น", message: message, preferredStyle: UIAlertController.Style.alert)
        
//        Create Button
        objAlertDialog.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            objAlertDialog.dismiss(animated: true, completion: nil)
        }))
        
        present(objAlertDialog, animated: true, completion: nil)
        
        
        
    }
    

}   // Main Class

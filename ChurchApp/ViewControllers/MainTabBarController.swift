//
//  ViewController.swift
//  ChurchApp
//
//  Created by Jessica  Gomes on 2/27/19.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

import UIKit

import Firebase
import FirebaseAuth


class MainTabBarController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    static var userLogIn: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    @IBAction func singIn(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
            
            if user != nil {
                print("User has sign IN")
                
                let ref = Database.database().reference().child("User")
                
                ref.observe(.value, with: {
                    snapshot in
                    
                    guard let values = snapshot.value as? [AnyObject] else{return}
                    for item in values {
                        guard let email = item["email"] as? String else{return}
                        if email == self.email.text{
                            userNameAuth = item["name"] as! String
                            positionAuth = item["position"] as! String
                        }
                    }
                })
                
            
            //--------Call HOME VIEW LOGIN-----//
            
            let storyboard  = UIStoryboard(name: "Manager", bundle: nil) // First create constant variable using storyboard
            
            let secondVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            
            self.navigationController?.pushViewController(secondVC, animated: true)
            }
            
            //--------------------------------//
            if error != nil{
                print("=(")
            }
        }
        
        
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
            
            if user != nil {
                print("User has sign up")
            }
            if error != nil{
                print("=(")
            }
        }
    }
    
    
}



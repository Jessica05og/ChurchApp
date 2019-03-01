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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
       // let ref = Database.database().reference()
        
        }
    
    @IBAction func singIn(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
            
            if user != nil {
                print("User has sign IN")
                
//                //--------Call HOME VIEW LOGIN-----//
//                
//                let storyboard  = UIStoryboard(name: "Main", bundle: nil) // First create constant variable using storyboard
//                
//                let secondVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//                
//                self.navigationController?.pushViewController(secondVC, animated: true)
//                
//                //--------------------------------//
                
            }
            //--------Call HOME VIEW LOGIN-----//
            
            let storyboard  = UIStoryboard(name: "Main", bundle: nil) // First create constant variable using storyboard
            
            let secondVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            
            self.navigationController?.pushViewController(secondVC, animated: true)
            
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



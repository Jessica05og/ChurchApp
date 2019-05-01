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
                
                let ref = Database.database().reference().child("User").queryOrdered(byChild: "email").queryEqual(toValue : self.email.text)
                
                ref.observe(.value, with: {
                    snapshot in
                    guard let user = snapshot.value as? [AnyObject] else{return}
                    guard let position = user[0].value(forKeyPath: "position") as? String else {return}
                    guard let name = user[0].value(forKeyPath: "name") as? String else {return}
                    userNameAuth = name
                    positionAuth = position
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



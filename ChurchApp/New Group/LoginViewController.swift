//
//  SecondViewController.swift
//  ChurchApp
//
//  Created by Jessica  Gomes on 2/28/19.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        self.title = "Login"
        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func SignOut(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            
        } catch let err {
            
            print("Failed to sign out error: ", err)
        }
        
        
        let storyboard  = UIStoryboard(name: "Main", bundle: nil) // First create constant variable using storyboard
        
        let secondVC = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    
        
        
    }
    
    
    

}

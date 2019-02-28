//
//  ViewController.swift
//  ChurchApp
//
//  Created by Jessica  Gomes on 2/27/19.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI


class MainTabBarController: UIViewController {

    //Button user submiting a email
    @IBOutlet var emailTF: UITextField!
    //Button password submiting a password
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let ref = Database.database().reference()
        
        }
        
    @IBAction func loginButton(_ sender: UIButton) {
        //Get the Default auth UI object
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {

            //Log the error
            return
        }
        
        // Set ourselves as the delegate
        authUI?.delegate = self
        // Get a reference to the auth UI view Controller
        
        let authViewController = authUI!.authViewController()
        // show it
        present(authViewController, animated: true, completion: nil)
        
    }
}
    
extension MainTabBarController: FUIAuthDelegate{
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        // check if there was an error
        guard error == nil else {
            //Log the error
            return
        }
        
       // authDataResult?.user.uid
        
        performSegue(withIdentifier: "GoHome", sender: self)
        
    }
    
    
}



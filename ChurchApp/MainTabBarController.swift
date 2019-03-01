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
        
//    @IBAction func loginButton(_ sender: UIButton) {
//        //Get the Default auth UI object
//        let authUI = FUIAuth.defaultAuthUI()
//
//        guard authUI != nil else {
//
//            //Log the error
//            return
//        }
//
//        // Set ourselves as the delegate
//        authUI?.delegate = self
//        // Get a reference to the auth UI view Controller
//
//        let authViewController = authUI!.authViewController()
//        // show it
//        present(authViewController, animated: true, completion: nil)
//
//    }
    
    
//    @IBAction func SingIn(_ sender: UIButton) {
//
//
//        Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
//
//            if user != nil {
//                print("User has sign Up")
//            }
//            if error != nil{
//                print("=(")
//            }
//        }
//
//    }
//
//
//
//    @IBAction func SingUp(_ sender: UIButton) {
//        Auth.auth().createUser(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
//
//            if user != nil {
//                print("User has sign up")
//            }
//            if error != nil{
//                print("=(")
//            }
//        }
//
//    }
    
    
    @IBAction func singIn(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
            
            if user != nil {
                print("User has sign Up")
            }
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
    
//extension MainTabBarController: FUIAuthDelegate{
//
//    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
//
//        // check if there was an error
//        guard error == nil else {
//            //Log the error
//            return
//        }
//
//       // authDataResult?.user.uid
//
//        performSegue(withIdentifier: "GoHome", sender: self)
//
//    }
//
//
//}



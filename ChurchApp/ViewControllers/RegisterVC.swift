//
//  RegisterVC.swift
//  ChurchApp
//
//  Created by Jessica  Gomes on 3/7/19.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import TinyConstraints


class RegisterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var ref: DatabaseReference?
    var countUsers = 0;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference(withPath: "User")
        
        ref!.observe(.value, with: {snapshot in
            
            guard let values = snapshot.value as? [AnyObject] else{
                return
            }
            self.countUsers = values.count
        })
        
        NameTextFild.delegate = self
        EmailTextFild.delegate = self
        ContactNumberTextFild.delegate = self
        Password.delegate = self
        Password2.delegate = self
        
    }
//--------------------[Oltlets]-----------------
    @IBOutlet weak var NameTextFild: UITextField!
    @IBOutlet weak var EmailTextFild: UITextField!
    @IBOutlet var ContactNumberTextFild: UITextField!
    @IBOutlet weak var UserPosition: UILabel!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Password2: UITextField!
    @IBOutlet weak var label: UILabel!
    //-----------------------

    
    //-----------[POSITION CHOICE]---------
    @IBOutlet weak var pickerView: UIPickerView!

    
    //List of elements on PickerView
    let position = ["--Select--","Leader", "Member", "Admin"]
    // Func section row that we want
    func numberOfComponents(in pickerView: UIPickerView) ->Int{
        return 1
    }
    // what text should be in each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return position[row]
    }
    // return how many rows we want
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return position.count
    }
    // diplay which row picked
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserPosition.text = position[row]
    }
    
    
    //--------------------------------------------------------------------------------------------------
    // validation
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ContactNumberTextFild.resignFirstResponder()
    }
    
    
    //--------------------------------------------------------------------------------------------------
    // insert onto the firebase


    @IBAction func CommitButton(_ sender: Any) {
        ref?.child(String(countUsers)).child("name").setValue(NameTextFild.text)
        ref?.child(String(countUsers)).child("email").setValue(EmailTextFild.text)
        ref?.child(String(countUsers)).child("contact").setValue(ContactNumberTextFild.text)
        ref?.child(String(countUsers)).child("position").setValue(UserPosition.text)
       

        let pass = String(Password.text!)
        let email = String(EmailTextFild.text!)
        
        if ValidPass(pass1: Password.text ?? "", pass2: Password2.text ?? "."){
            Auth.auth().createUser(withEmail: email, password: pass ){ (authResult, error) in
                
                guard (authResult?.user) != nil else { return }; if error != nil {
                    
                }
            }
        }
        
        
    }
    
    
    func ValidPass(pass1: String, pass2: String) -> Bool {

        if pass1 == pass2{
            if (pass1.count < 5) || ( pass1.count > 8) {
                
                return true
            }else{
                label.text = "passwort between 6-8 digits"
            }
            return true
        }else{
            label.text = "Password doesn't match"
            return false
        }
    }
}



extension RegisterVC :  UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

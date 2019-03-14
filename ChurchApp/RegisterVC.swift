//
//  RegisterVC.swift
//  ChurchApp
//
//  Created by Jessica  Gomes on 3/7/19.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

import UIKit
import FirebaseDatabase


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
    }
//--------------------[Oltlets]-----------------
    @IBOutlet weak var NameTextFild: UITextField!
    @IBOutlet weak var EmailTextFild: UITextField!
    @IBOutlet weak var ContactNumberTextFild: UITextField!
    
    //-----------[POSITION CHOICE]---------
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
//--------------[GROUP CHOICE]------------------
    @IBOutlet weak var pickerVireGroup: UIPickerView!
    @IBOutlet weak var labelGroup: UILabel!
   
    //List of elements on PickerView
    let position = ["Leader", "Member", "Admin"]
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
        label.text = position[row]
    }
    
    
    
//--------------------------------------------------------------------------------------------------
    //List of elements on PickerView
    let groups = ["Media", "Welcome", "One More Song","Translation","Breaking of Bread"]
    //Func section row that we want
    func numberOfComponents2(in pickerVireGroup: UIPickerView) ->Int{
        return 1
    }
    // what text should be in each row
    func pickerVireGroup(_ pickerVireGroup: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return groups[row]
    }
    // return how many rows we want
    func pickerVireGroup(_ pickerVireGroup: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return groups.count
    }
    // diplay which row picked
    func pickerVireGroup(_ pickerVireGroup: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelGroup.text = groups[row]
    }
//--------------------------------------------------------------------------------------------------
    


    @IBAction func CommitButton(_ sender: Any) {
        
        
        
        ref?.child(String(countUsers)).child("name").setValue(NameTextFild.text)
        ref?.child(String(countUsers)).child("email").setValue(EmailTextFild.text)
        ref?.child(String(countUsers)).child("tel").setValue(ContactNumberTextFild.text)
    }
    
}

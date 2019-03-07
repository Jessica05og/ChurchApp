//
//  RegisterVC.swift
//  ChurchApp
//
//  Created by Jessica  Gomes on 3/7/19.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
//--------------[POSITION CHOICE]-----------------
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
//--------------[GROUP CHOICE]------------------
    @IBOutlet weak var labelGroup: UILabel!
    @IBOutlet weak var pickerVireGroup: UIPickerView!

    
    
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
    // Func section row that we want
    func numberOfComponentsGroups(in pickerVireGroup: UIPickerView) ->Int{
        return 1
    }
    // what text should be in each row
    func pickerVireGroup(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return position[row]
    }
    // return how many rows we want
    func pickerVireGroup(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return groups.count
    }
    // diplay which row picked
    func pickerVireGroup(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = position[row]
    }
//--------------------------------------------------------------------------------------------------
    


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}

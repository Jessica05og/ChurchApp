//
//  RegisterVC.swift
//  ChurchApp
//
//  Created by Jessica  Gomes on 3/7/19.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var label: UILabel!
    
    
    
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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}

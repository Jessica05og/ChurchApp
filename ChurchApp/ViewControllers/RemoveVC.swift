//
//  RemoveVC.swift
//  
//
//  Created by Jessica  Gomes on 3/20/19.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class RemoveVC: UIViewController {
    
    
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
    

}

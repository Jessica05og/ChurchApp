//
//  RemoveVC.swift
//  
//
//  Created by Jessica  Gomes on 3/20/19.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class RemoveVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let usersRef = Database.database().reference(withPath: "User")
    var users: [User] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersRef.observe(.value, with: {
            snapshot in
            
            guard let values = snapshot.value as? [AnyObject] else{return}
            self.users = []
            for item in values {
                guard let contact = item["contact"] as? String else{return}
                guard let email = item["email"] as? String else{return}
                guard let name = item["name"] as? String else{return}
                guard let position = item["position"] as? String else{return}
                
                self.users.append(User(position: position, email: email, contact: contact, name: name))
                self.tableView.reloadData()
            }
            
            
                
        })
       
        
    }
    
    
    // MARK: UITableView Delegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RemoveCell", for: indexPath) as! RemoveCell
        cell.setupCell(user: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        usersRef.child(indexPath.row.description).setValue(nil)
        

    }
    

}

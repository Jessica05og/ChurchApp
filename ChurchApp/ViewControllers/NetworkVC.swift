//
//  NetworkVC.swift
//  ChurchApp
//
//  Created by Cidox on 01/05/2019.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class NetworkVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var messageRef: DatabaseReference?
    var messages: [Message] = []
    var messageIndex = 0
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendMessage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        messageRef = Database.database().reference(withPath: "Message")
        messageRef!.observe(.value, with: {
            snapshot in
            
            guard let values = snapshot.value as? [AnyObject] else{return}
            self.messages = []
            for item in values {
                guard let position = item["position"] as? String else{return}
                guard let message = item["message"] as? String else{return}
                guard let name = item["name"] as? String else{return}
                
                self.messages.append(Message(position: position, message: message, name: name))
                self.messageIndex = self.messages.count - 1
                self.tableView.reloadData()
            }
            
            
            
        })
    }
    
    
    @IBAction func send(_ sender: Any) {
        
      self.messageRef?.child(String(self.messages.count)).child("name").setValue(userNameAuth)
    self.messageRef?.child(String(self.messages.count)).child("message").setValue(self.sendMessage.text)
    self.messageRef?.child(String(self.messages.count)).child("position").setValue(positionAuth)
        
    self.messageRef?.child(String(self.messages.count)).child("id").setValue(String(self.messages.count))
        
        
        
        
        sendMessage.text = ""
        
        
    }
    
    
    // MARK: UITableView Delegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NetworkCell", for: indexPath) as! NetworkCell
        cell.setupCell(message: messages[messageIndex - indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}

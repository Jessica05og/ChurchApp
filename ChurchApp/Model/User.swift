//
//  User.swift
//  ChurchApp
//
//  Created by Jessica  Gomes on 25/04/2019.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

var userNameAuth: String = "Test"
var positionAuth: String = "Admin"

struct User {
    
    let position: String
    let email: String
    let contact: String
    let name: String
    
    
//    init(authData: User) {
//        uid = authData.uid
//        email = authData.email
//    }
    
    init(position: String, email: String, contact: String, name: String) {
        self.position = position
        self.email = email
        self.contact = contact
        self.name = name
    }
    
}

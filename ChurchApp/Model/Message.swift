//
//  Message.swift
//  ChurchApp
//
//  Created by Jessica  Gomes on 01/05/2019.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

import Foundation

struct Message {
    
    let position: String
    let message: String
    let name: String
    
    init(position: String, message: String, name: String) {
        self.position = position
        self.message = message
        self.name = name
    }
    
}

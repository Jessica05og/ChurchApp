//
//  NetworkCell.swift
//  ChurchApp
//
//  Created by Cidox on 01/05/2019.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

import UIKit

class NetworkCell: UITableViewCell {

    @IBOutlet weak var positionImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var message: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(message: Message){
        if message.position == "Admin"{
            positionImage.image = UIImage(named: "admin.png")
        }else if message.position == "Leader"{
            positionImage.image = UIImage(named: "leader.png")
        }else{
            positionImage.image = UIImage(named: "member.png")
        }
        name.text = message.name
        self.message.text = message.message
    }

}

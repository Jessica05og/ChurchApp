//
//  RemoveCell.swift
//  ChurchApp
//
//  Created by Cidox on 25/04/2019.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

import UIKit

class RemoveCell: UITableViewCell {

    @IBOutlet weak var memberType: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var memberDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(user: User){
        if user.position == "Admin"{
            memberType.image = UIImage(named: "admin.png")
            memberDescription.text = "Admin"
        }else if user.position == "Leader"{
            memberType.image = UIImage(named: "leader.png")
            memberDescription.text = "Leader"
        }else{
             memberType.image = UIImage(named: "member.png")
            memberDescription.text = "Member"
        }
        name.text = user.name
    }

}

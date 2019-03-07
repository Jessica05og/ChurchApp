//
//  ContactUsVC.swift
//  ChurchApp
//
//  Created by Jessica  Gomes on 2/27/19.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

import UIKit

class LocationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func Location(_ sender: Any) {
        
        guard let url = URL(string: "https://goo.gl/maps/BWbwkECzBMF2") else {
            return //be safe
        }
        
        if #available(iOS 9.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    

}

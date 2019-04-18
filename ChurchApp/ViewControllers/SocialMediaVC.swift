//
//  SocialMediaVC.swift
//  ChurchApp
//
//  Created by Jessica  Gomes on 3/6/19.
//  Copyright © 2019 Jessica  Gomes. All rights reserved.
//

import UIKit

class SocialMediaVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    //------------- Instagram Button -------------
    @IBAction func InstagramButton(_ sender: Any) {
        
        guard let url = URL(string: "https://www.instagram.com/selahchurch/?hl=en") else {
            return //be safe
        }
        
        if #available(iOS 9.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    //------------- Facebook Button -------------
    @IBAction func FacebookButton(_ sender: Any) {
        guard let url = URL(string: "https://www.facebook.com/selahchurchdublin/") else {
            return //be safe
        }
        
        if #available(iOS 9.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    //------------- Youtube Button -------------
    @IBAction func YoutubeButton(_ sender: Any) {
        guard let url = URL(string: "https://www.youtube.com/channel/UCFRLK9Tef-vQYai97iPQQUQ") else {
            return //be safe
        }
        
        if #available(iOS 9.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    //------------- Podcast Button -------------
    @IBAction func PodcastButton(_ sender: Any) {
        guard let url = URL(string: "https://www.google.com") else {
            return //be safe
        }
        
        if #available(iOS 9.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    //------------- Spotify Button -------------
    @IBAction func SpotifyButton(_ sender: Any) {
        guard let url = URL(string: "https://open.spotify.com/playlist/67wZZL6BdBIGAEtV3vEm2E?si=6AfW-A7NSS2FcqaovSXh9A") else {
            return //be safe
        }
        
        if #available(iOS 9.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    //------------- Web site Button -------------
    @IBAction func WebsiteButton(_ sender: Any) {
        guard let url = URL(string: "https://selahchurch.ie/") else {
            return //be safe
        }
        
        if #available(iOS 9.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}

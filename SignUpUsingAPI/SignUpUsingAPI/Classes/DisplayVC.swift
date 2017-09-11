//
//  DisplayVC.swift
//  SignUpUsingAPI
//
//  Created by Appinventiv Technologies on 11/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class DisplayVC: UIViewController {
//    -------- Variable's -----------
   
    var name:Any!
    var email:Any!
    var password:Any!
    var contact:Any!
    var adress:Any!
    var city:Any!
    var country:Any!
//-------------------------------
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        if name != "" && email != ""  && password != ""  && contact != ""  && adress != ""  && city != "" && country != ""{
            nameLabel.text = name as? String
            emailLabel.text = email as? String
            passwordLabel.text = password as? String
            contactLabel.text = contact as? String
            addressLabel.text = adress as? String
            cityLabel.text = city as? String
            countryLabel.text = country as? String
//
//        }
    
    }

    
    
}

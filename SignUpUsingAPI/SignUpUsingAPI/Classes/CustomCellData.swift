//
//  CustomCellData.swift
//  SignUpUsingAPI
//
//  Created by Appinventiv Technologies on 11/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class CustomCellData: UITableViewCell {
//------------ Outlet's -------------------
   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
//    -----------------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}

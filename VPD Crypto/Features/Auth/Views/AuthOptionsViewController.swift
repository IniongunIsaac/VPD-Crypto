//
//  AuthOptionsViewController.swift
//  24 Heights Customer
//
//  Created by Isaac Iniongun on 18/11/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import UIKit

class AuthOptionsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavBar()
    }

    @IBAction func createAccountButtonTapped(_ sender: Any) {
        pushViewController(R.storyboard.auth.createAccountViewController()!)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        pushViewController(R.storyboard.auth.loginViewController()!)
    }
    
}

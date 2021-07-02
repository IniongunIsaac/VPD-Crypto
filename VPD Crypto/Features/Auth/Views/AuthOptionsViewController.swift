//
//  AuthOptionsViewController.swift
//  24 Heights Customer
//
//  Created by Isaac Iniongun on 18/11/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import UIKit

class AuthOptionsViewController: BaseViewController {
    
    var authViewModel: IAuthViewModel!
    override func getViewModel() -> BaseViewModel { authViewModel as! BaseViewModel }
    
    override func configureViews() {
        super.configureViews()
        hideNavBar()
    }

    @IBAction func createAccountButtonTapped(_ sender: Any) {
        pushViewController(R.storyboard.auth.createAccountViewController()!)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        pushViewController(R.storyboard.auth.loginViewController()!)
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeShowDashboard()
    }
    
    fileprivate func observeShowDashboard() {
        authViewModel.showDashboard.bind { [weak self] show in
            if show {
                self?.navigateToDashboard()
            }
        }.disposed(by: disposeBag)
    }
    
}

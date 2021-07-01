//
//  AuthOptionsViewController.swift
//  24 Heights Customer
//
//  Created by Isaac Iniongun on 18/11/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import UIKit

class AuthOptionsViewController: BaseViewController {

    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    var authViewModel: IAuthViewModel!
    override func getViewModel() -> BaseViewModel { authViewModel as! BaseViewModel }
    
    fileprivate lazy var views: [UIView] = { [createAccountButton, loginButton] }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavBar()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        authViewModel.getAPIToken()
    }

    @IBAction func createAccountButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        pushViewController(R.storyboard.auth.loginViewController()!)
    }
    
    override func showLoading() {
        super.showLoading()
        views.disableUserInteraction()
    }
    
    override func hideLoading() {
        super.hideLoading()
        views.enableUserInteraction()
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeShowHome()
    }
    
    fileprivate func observeShowHome() {
        authViewModel.showHome.bind { [weak self] show in
            if show {
                self?.navigateToHome()
            }
        }.disposed(by: disposeBag)
    }
    
}

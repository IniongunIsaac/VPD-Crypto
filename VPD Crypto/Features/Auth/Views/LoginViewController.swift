//
//  LoginViewController.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var backNavImageView: UIImageView!
    @IBOutlet weak var emailAddressTextField: AppTextfield!
    @IBOutlet weak var passwordTextField: AppTextfield!
    @IBOutlet weak var parentScrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    fileprivate lazy var views: [UIView] = {
        [createAccountButton, loginButton, forgotPasswordButton]
    }()
    
    var authViewModel: IAuthViewModel!
    override func getViewModel() -> BaseViewModel { authViewModel as! BaseViewModel }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavBar()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        navigateToHome()
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        pushViewController(R.storyboard.auth.createAccountViewController()!.apply {
            $0.authNavType = .login
        })
    }
    
    override func configureViews() {
        super.configureViews()
        [emailAddressTextField, passwordTextField].addClearBackground()
        backNavImageView.animateViewOnTapGesture(duration: 0.3) { [weak self] in
            self?.popViewController()
        }
    }
    
    override func showLoading() {
        views.disableUserInteraction()
    }
    
    override func hideLoading() {
        views.enableUserInteraction()
    }
    
    override func setChildViewControllerObservers() {
        observeValidationMessages()
        observeShowHome()
    }
    
    fileprivate func observeValidationMessages() {
        authViewModel.validationMessage.bind { [weak self] msg in
            switch msg.validationType {
            case .email:
                self?.emailAddressTextField.showMessage(msg)
            case .password:
                self?.passwordTextField.showMessage(msg)
            default:
                debugPrint(AppConstants.VALIDATION_TYPE_NOT_APPLICABLE)
            }
            
        }.disposed(by: disposeBag)
    }
    
    fileprivate func observeShowHome() {
        authViewModel.showHome.bind { [weak self] show in
            if show {
                
            }
        }.disposed(by: disposeBag)
    }

}

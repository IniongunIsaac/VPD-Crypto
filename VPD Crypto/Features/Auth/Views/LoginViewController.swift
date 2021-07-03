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
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    var authViewModel: IAuthViewModel!
    override func getViewModel() -> BaseViewModel { authViewModel as! BaseViewModel }
    
    override var views: [UIView] { [createAccountButton, loginButton] }
    
    override var horizontalProgressBarYPosition: CGFloat { backNavImageView.minY - 2 }
    
    var authNavType: AuthNavigationType = .authOptions
    
    override func configureViews() {
        super.configureViews()
        hideNavBar()
        [emailAddressTextField, passwordTextField].addClearBackground()
        backNavImageView.addPopGesture(on: self)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        authViewModel.login(email: emailAddressTextField.text, password: passwordTextField.text)
    }
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        switch authNavType {
        case .createAccount:
            popViewController()
        case .authOptions:
            pushViewController(R.storyboard.auth.createAccountViewController()!.apply {
                $0.authNavType = .login
            })
        default:
            break
        }
    }
    
    override func setChildViewControllerObservers() {
        observeValidationMessages()
        observeShowDashboard()
    }
    
    /// Observe validations messages from the ViewModel
    /// We're interested in validation results for email and password
    fileprivate func observeValidationMessages() {
        authViewModel.validationMessages.bind { [weak self] msg in
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
    
    fileprivate func observeShowDashboard() {
        authViewModel.showDashboard.bind { [weak self] show in
            if show {
                self?.navigateToDashboard()
            }
        }.disposed(by: disposeBag)
    }

}

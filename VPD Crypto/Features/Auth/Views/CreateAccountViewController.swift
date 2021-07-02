//
//  RegisterViewController.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import UIKit

class CreateAccountViewController: BaseViewController {

    @IBOutlet weak var fullnameTextfield: AppTextfield!
    @IBOutlet weak var emailTextfield: AppTextfield!
    @IBOutlet weak var passwordTextfield: AppTextfield!
    @IBOutlet weak var confirmPasswordTextfield: AppTextfield!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var contentViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var backIconImageView: UIImageView!
    
    override var views: [UIView] { [createAccountButton, loginButton] }
    
    var authNavType: AuthNavigationType = .authOptions
    
    var authViewModel: IAuthViewModel!
    override func getViewModel() -> BaseViewModel { authViewModel as! BaseViewModel }
    override var horizontalProgressBarYPosition: CGFloat { backIconImageView.minY - 2 }
    
    override func configureViews() {
        super.configureViews()
        hideNavBar()
        
        [fullnameTextfield, emailTextfield, passwordTextfield, confirmPasswordTextfield].addClearBackground()
        fullnameTextfield.keyboardType = .alphabet
        emailTextfield.keyboardType = .emailAddress
        
        backIconImageView.addPopGesture(on: self)
    }
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        authViewModel.createAccount(fullname: fullnameTextfield.text, email: emailTextfield.text, password: passwordTextfield.text, confirmPassword: confirmPasswordTextfield.text)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        switch authNavType {
        case .login:
            popViewController()
        case .authOptions:
            pushViewController(R.storyboard.auth.loginViewController()!.apply {
                $0.authNavType = .createAccount
            })
        default:
            break
        }
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeValidationMessages()
        observeShowDashboard()
    }
    
    fileprivate func observeValidationMessages() {
        authViewModel.validationMessages.bind { [weak self] msg in
            switch msg.validationType {
            case .firstName:
                self?.fullnameTextfield.showMessage(msg)
            case .email:
                self?.emailTextfield.showMessage(msg)
            case .password:
                self?.passwordTextfield.showMessage(msg)
            case .confirmPassword:
                self?.confirmPasswordTextfield.showMessage(msg)
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


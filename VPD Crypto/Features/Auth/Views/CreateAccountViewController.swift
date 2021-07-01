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
    @IBOutlet weak var phoneNumberTextfield: AppTextfield!
    @IBOutlet weak var emailTextfield: AppTextfield!
    @IBOutlet weak var passwordTextfield: AppTextfield!
    @IBOutlet weak var confirmPasswordTextfield: AppTextfield!
    @IBOutlet weak var parentScrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var contentViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var backIconImageView: UIImageView!
    
    fileprivate lazy var views: [UIView] = {
       [nextButton, loginButton]
    }()
    var authNavType: AuthNavigationType = .authOptions
    
    var authViewModel: IAuthViewModel!
    
    override func getViewModel() -> BaseViewModel { authViewModel as! BaseViewModel }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavBar()
    }
    
    override func showLoading() {
        views.disableUserInteraction()
    }
    
    override func hideLoading() {
        views.enableUserInteraction()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        authViewModel.validateInitialRegistrationDetails(fullname: fullnameTextfield.text.orEmpty, email: emailTextfield.text.orEmpty, phoneNo: phoneNumberTextfield.text.orEmpty, password: passwordTextfield.text.orEmpty, confirmPassword: confirmPasswordTextfield.text.orEmpty)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        switch authNavType {
        case .login:
            popViewController()
        case .authOptions:
            pushViewController(R.storyboard.auth.loginViewController()!)
        default:
            break
        }
    }
    
    override func configureViews() {
        super.configureViews()
        [fullnameTextfield, emailTextfield, passwordTextfield, confirmPasswordTextfield, phoneNumberTextfield].addClearBackground()
        fullnameTextfield.keyboardType = .alphabet
        passwordTextfield.isSecureTextEntry = true
        confirmPasswordTextfield.isSecureTextEntry = true
        phoneNumberTextfield.keyboardType = .phonePad
        emailTextfield.keyboardType = .emailAddress
        
        backIconImageView.addPopGesture(on: self)
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeValidationMessages()
        observeShowVehicleDetails()
    }
    
    fileprivate func observeValidationMessages() {
        authViewModel.validationMessage.bind { [weak self] msg in
            switch msg.validationType {
            case .firstName:
                self?.fullnameTextfield.showMessage(msg)
            case .email:
                self?.emailTextfield.showMessage(msg)
            case .phoneNumber:
                self?.phoneNumberTextfield.showMessage(msg)
            case .password:
                self?.passwordTextfield.showMessage(msg)
            case .confirmPassword:
                self?.confirmPasswordTextfield.showMessage(msg)
            default:
                debugPrint(AppConstants.VALIDATION_TYPE_NOT_APPLICABLE)
            }
        }.disposed(by: disposeBag)
    }
    
    fileprivate func observeShowVehicleDetails() {
        
    }

}


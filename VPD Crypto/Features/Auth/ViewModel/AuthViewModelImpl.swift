//
//  AuthViewModelImpl.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift
import DeviceKit

class AuthViewModelImpl: BaseViewModel, IAuthViewModel {
    
    var validationMessages: PublishSubject<ValidationMessage> = PublishSubject()
    var showDashboard: PublishSubject<Bool> = PublishSubject()
    
    fileprivate let inputValidator: IInputValidator
    fileprivate var preference: IPreference
    fileprivate let authRemoteDatasource: IAuthRemoteDataSource
    
    init(authRemoteDatasource: IAuthRemoteDataSource, inputValidator: IInputValidator, preference: IPreference) {
        self.authRemoteDatasource = authRemoteDatasource
        self.inputValidator = inputValidator
        self.preference = preference
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        showDashboard.onNext(preference.isLoggedIn)
    }
    
    func createAccount(fullname: String, email: String, password: String, confirmPassword: String) {
        let validationMsgs = [
            inputValidator.validateFirstName(name: fullname),
            inputValidator.validateEmailAddress(email: email),
            inputValidator.validatePassword(password: password),
            inputValidator.validateConfirmPassword(password: password, confirmPassword: confirmPassword)
        ]
        
        validationMsgs.forEach { msg in validationMessages.onNext(msg) }
        let validValues = validationMsgs.filter { !$0.isValid }.isEmpty
        
        if validValues {
            subscribeAny(authRemoteDatasource.signUp(email: email, password: password), success: { [weak self] _ in
                let user = VPDUser(fullname: fullname, email: email)
                self?.saveUserData(user)
            })
        }
    }
    
    fileprivate func saveUserData(_ user: VPDUser) {
        subscribeAny(authRemoteDatasource.saveUserData(user: user), success: { [weak self] in
            self?.showDashboard.onNext(true)
        })
    }
    
    func login(email: String, password: String) {
        let validationMsgs = [
            inputValidator.validateEmailAddress(email: email),
            inputValidator.validatePassword(password: password)
        ]
        
        validationMsgs.forEach { msg in validationMessages.onNext(msg) }
        let validValues = validationMsgs.filter { !$0.isValid }.isEmpty
        
        if validValues {
            subscribeAny(authRemoteDatasource.signIn(email: email, password: password), success: { [weak self] _ in
                self?.showDashboard.onNext(true)
            })
        }
    }
}

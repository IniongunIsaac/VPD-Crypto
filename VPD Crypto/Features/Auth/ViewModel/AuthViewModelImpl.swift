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
    
    var validationMessage: PublishSubject<ValidationMessage> = PublishSubject()
    var showHome: PublishSubject<Bool> = PublishSubject()
    var showChangePassword: PublishSubject<Bool> = PublishSubject()
    var showVehicleDetails: PublishSubject<Bool> = PublishSubject()
    var showDocumentUpload: PublishSubject<Bool> = PublishSubject()
    var showVerification: PublishSubject<Bool> = PublishSubject()
    var showServiceTypes: PublishSubject<Bool> = PublishSubject()
    var serviceTypes: [ProviderType] = []
    
    fileprivate var emailAddress = ""
    fileprivate var oneTimePassword = ""
    fileprivate var registrationData: BodyParam = [:]
    
    fileprivate var authRepo: IAuthRepo
    fileprivate let inputValidator: IInputValidator
    fileprivate var preferenceRepo: IPreferenceRepo
    
    init(authRepo: IAuthRepo, inputValidator: IInputValidator, preferenceRepo: IPreferenceRepo) {
        self.authRepo = authRepo
        self.inputValidator = inputValidator
        self.preferenceRepo = preferenceRepo
    }
    
    func getAPIToken() {
        if let token = preferenceRepo.token, token.expiryDate.greater(Date()) {
            if preferenceRepo.isLoggedIn {
                showHome.onNext(true)
            }
        } else {
            subscribe(authRepo.getToken()) { [weak self] token in
                self?.preferenceRepo.token = token
            } error: { [weak self] _ in
                self?.getAPIToken()
            }
        }
    }
    
    func validateInitialRegistrationDetails(fullname: String, email: String, phoneNo: String, password: String, confirmPassword: String) {
        let validationMsgs = [
            inputValidator.validateFirstName(name: fullname),
            inputValidator.validateEmailAddress(email: email),
            inputValidator.validatePassword(password: password),
            inputValidator.validateConfirmPassword(password: password, confirmPassword: confirmPassword),
            inputValidator.validatePhoneNumber(phoneNo: phoneNo)
        ]
        
        validationMsgs.forEach { msg in validationMessage.onNext(msg) }
        let validValues = validationMsgs.filter { !$0.isValid }.isEmpty
        
        if validValues {
            emailAddress = email
            registrationData = [
                "name": fullname,
                "emailAddress": email,
                "phoneNumber": phoneNo,
                "password": password,
                "deviceToken": deviceUUID
            ]
            showVehicleDetails.onNext(true)
        }
    }
    
    func createAccount(vehicleType: Int, vehicleBrand: String, vehicleModel: String, vehicleYear: String, vehicleLicense: String, vehicleColor: String, serviceType: Int) {
        
    }
}

//
//  IAuthViewModel.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

protocol IAuthViewModel {
    
    var validationMessage: PublishSubject<ValidationMessage> { get }
    
    var showHome: PublishSubject<Bool> { get }
    
    var showChangePassword: PublishSubject<Bool> { get }
    
    var showVehicleDetails: PublishSubject<Bool> { get }
    
    var showDocumentUpload: PublishSubject<Bool> { get }
    
    var showVerification: PublishSubject<Bool> { get }
    
    var showServiceTypes: PublishSubject<Bool> { get }
    
    var serviceTypes: [ProviderType] { get }
    
    func getAPIToken()
    
    func validateInitialRegistrationDetails(fullname: String, email: String, phoneNo: String, password: String, confirmPassword: String)
    
    func createAccount(vehicleType: Int, vehicleBrand: String, vehicleModel: String, vehicleYear: String, vehicleLicense: String, vehicleColor: String, serviceType: Int)
    
}

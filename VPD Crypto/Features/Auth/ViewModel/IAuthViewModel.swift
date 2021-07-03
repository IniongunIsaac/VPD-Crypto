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
    
    var validationMessages: PublishSubject<ValidationMessage> { get }
    
    var showDashboard: PublishSubject<Bool> { get }
    
    /// This method validates and creates an account for a user upon successful validation
    /// - Parameters:
    ///   - fullname: Fullname of the user
    ///   - email: email of the user
    ///   - password: password of the user
    ///   - confirmPassword: confirm password value for password supplied in `password`. It is useful for validation purposes.
    func createAccount(fullname: String, email: String, password: String, confirmPassword: String)
    
    /// This method log's a user into the application
    /// - Parameters:
    ///   - email: user's email
    ///   - password: user's password
    func login(email: String, password: String)
    
}

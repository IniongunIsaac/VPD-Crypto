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
    
    func createAccount(fullname: String, email: String, password: String, confirmPassword: String)
    
    func login(email: String, password: String)
    
}

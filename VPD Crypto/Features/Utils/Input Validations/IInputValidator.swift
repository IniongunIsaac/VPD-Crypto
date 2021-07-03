//
//  IInputValidator.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

protocol IInputValidator {
    
    func validateEmailAddress(email: String) -> ValidationMessage
    
    func validateName(name: String) -> ValidationMessage
    
    func validatePassword(password: String) -> ValidationMessage
    
    func validateConfirmPassword(password: String, confirmPassword: String) -> ValidationMessage
    
}

//
//  InputValidatorImpl.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct InputValidatorImpl: IInputValidator {
    
    func validateEmailAddress(email: String) -> ValidationMessage {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        if email.isEmpty {
            return ValidationMessage(message: .emailEmpty, validationType: .email)
        } else if !emailPredicate.evaluate(with: email.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return ValidationMessage(message: .invalidEmail, validationType: .email)
        }
        
        return ValidationMessage(isValid: true, message: .empty, validationType: .email)
    }
    
    func validateName(name: String) -> ValidationMessage {
        validateNameText(name: name, emptyMessage: .nameEmpty, invalidMessage: .invalidName, validationType: .name)
    }
    
    func validatePassword(password: String) -> ValidationMessage {
        
        if password.isEmpty {
            return ValidationMessage(message: .passwordEmpty, validationType: .password)
        } else if password.count < 6 {
            return ValidationMessage(message: .invalidPassword, validationType: .password)
        }
        
        return ValidationMessage(isValid: true, message: .empty, validationType: .password)
    }
    
    func validateConfirmPassword(password: String, confirmPassword: String) -> ValidationMessage {
        
        if confirmPassword.isEmpty {
            return ValidationMessage(message: .confirmPasswordEmpty, validationType: .confirmPassword)
        } else if confirmPassword.count < 6 {
            return ValidationMessage(message: .invalidConfirmPassword, validationType: .confirmPassword)
        } else if password != confirmPassword {
            return ValidationMessage(message: .passwordMismatch, validationType: .confirmPassword)
        }
        
        return ValidationMessage(isValid: true, message: .empty, validationType: .confirmPassword)
    }
    
    /// Utility function to validate name texts
    /// - Parameters:
    ///   - name: value to be validated
    ///   - emptyMessage: `ValidationMessageConstants` enum constant to be returned in cases of successful validation
    ///   - invalidMessage: `ValidationMessageConstants` enum constant to be returned when validation fails
    ///   - validationType: `ValidationType` to be returned
    ///   - nameRegex: regular expression to be used for validation. Defaults to "[A-Za-z ]{2,}"
    /// - Returns: `ValidationMessage` indicating result of validation
    fileprivate func validateNameText(name: String, emptyMessage: ValidationMessageConstants, invalidMessage: ValidationMessageConstants, validationType: ValidationType, nameRegex: String = "[A-Za-z ]{2,}") -> ValidationMessage {
        
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        
        if name.isEmpty {
            return ValidationMessage(message: emptyMessage, validationType: validationType)
        } else if !namePredicate.evaluate(with: name.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return ValidationMessage(message: invalidMessage, validationType: validationType)
        }
        
        return ValidationMessage(isValid: true, message: .empty, validationType: validationType)
    }

}

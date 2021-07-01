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
    
    /// Checks that an `emailOrPhone` is not empty.
    /// Email addresses must be in the email address format.
    /// Phone numbers must be exactly 11digits for Nigerian numbers or exactly 10digits for Ghanian numbers.
    func validateEmailOrPhone(emailOrPhone: String) -> ValidationMessage {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        let nigerianPhoneNoRegex = "^[0-9+]{11}$"
        let nigerianPhoneNoPredicate = NSPredicate(format: "SELF MATCHES %@", nigerianPhoneNoRegex)
        
        let ghanaPhoneNoRegex = "^[0-9+]{10}$"
        let ghanaPhoneNoPredicate = NSPredicate(format: "SELF MATCHES %@", ghanaPhoneNoRegex)
        
        if emailOrPhone.isEmpty {
            return ValidationMessage(message: .emailOrPhoneEmpty, validationType: .emailOrPhone)
        } else if !emailPredicate.evaluate(with: emailOrPhone.trimmingCharacters(in: .whitespacesAndNewlines)) &&
            !nigerianPhoneNoPredicate.evaluate(with: emailOrPhone.trimmingCharacters(in: .whitespacesAndNewlines)) &&
            !ghanaPhoneNoPredicate.evaluate(with: emailOrPhone.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return ValidationMessage(message: .emailOrPhoneInvalid, validationType: .emailOrPhone)
        }
        
        return ValidationMessage(isValid: true, message: .empty, validationType: .emailOrPhone)
    }
    
    func validatePhoneNumber(phoneNo: String) -> ValidationMessage {
        validatePhoneNo(phoneNo, emptyMessage: .phoneEmpty, invalidMessage: .invalidPhone, validationType: .phoneNumber)
    }
    
    func validateName(name: String) -> ValidationMessage {
        validateNameText(name: name, emptyMessage: .nameEmpty, invalidMessage: .invalidName, validationType: .name)
    }
    
    func validateLastName(name: String) -> ValidationMessage {
        validateNameText(name: name, emptyMessage: .lastNameEmpty, invalidMessage: .invalidLastName, validationType: .lastName)
    }
    
    func validateFirstName(name: String) -> ValidationMessage {
        validateNameText(name: name, emptyMessage: .firstNameEmpty, invalidMessage: .invalidFirstName, validationType: .firstName)
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
    
    fileprivate func validatePhoneNo(_ phoneNo: String, emptyMessage: ValidationMessageConstants, invalidMessage: ValidationMessageConstants, validationType: ValidationType) -> ValidationMessage {
        
        let nigerianPhoneNoRegex = "^[0-9+]{11}$"
        let nigerianPhoneNoPredicate = NSPredicate(format: "SELF MATCHES %@", nigerianPhoneNoRegex)
        
        let ghanaPhoneNoRegex = "^[0-9+]{10}$"
        let ghanaPhoneNoPredicate = NSPredicate(format: "SELF MATCHES %@", ghanaPhoneNoRegex)
        
        if phoneNo.isEmpty {
            return ValidationMessage(message: emptyMessage, validationType: validationType)
        } else if !nigerianPhoneNoPredicate.evaluate(with: phoneNo.trimmingCharacters(in: .whitespacesAndNewlines)) &&
            !ghanaPhoneNoPredicate.evaluate(with: phoneNo.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return ValidationMessage(message: invalidMessage, validationType: validationType)
        }
        
        return ValidationMessage(isValid: true, message: .empty, validationType: validationType)
    }
    
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

//
//  ValidationMessageConstants.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

enum ValidationMessageConstants: String {
    case empty = ""
    case emailEmpty = "Email is required."
    case invalidEmail = "Invalid email address.\nEmail addresses must be in the format: someone@email.com"
    case emailOrPhoneEmpty = "Email or phone number is required."
    case emailOrPhoneInvalid = "Email or phone number is invalid.\nEmail addresses must be in the format: someone@email.com\nNigerian phone numbers must be exactly 11 digits.\nGhanian phone numbers must be exactly 10 digits."
    case passwordEmpty = "Password is required."
    case invalidPassword = "Password must be at least six(6) characters."
    case nameEmpty = "Name is required."
    case invalidName = "Name must contain only letters with minimum two(2) characters."
    case firstNameEmpty = "Firstname is required."
    case invalidFirstName = "Firstname must contain only letters with minimum two(2) characters."
    case lastNameEmpty = "Lastname is required."
    case invalidLastName = "Lastname must contain only letters with minimum two(2) characters."
    case phoneEmpty = "Phone number is required.."
    case invalidPhone = "Invalid phone number.\nNigerian phone numbers must be exactly 11 digits.\nGhanian phone numbers must be exactly 10 digits."
    case confirmPasswordEmpty = "Confirm password is required."
    case invalidConfirmPassword = "Confirm password value must be at least six(6) characters."
    case passwordMismatch = "Confirm Password and Password values do not match."
    
}

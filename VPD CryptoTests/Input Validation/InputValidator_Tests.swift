//
//  InputValidatorImpl_Tests.swift
//  VPD CryptoTests
//
//  Created by Isaac Iniongun on 03/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import XCTest
@testable import VPD_Crypto_Dev

class InputValidator_Tests: XCTestCase {
    
    fileprivate var inputValidator: IInputValidator!
    fileprivate let invalidEmail = "abc"
    fileprivate let validEmail = "abc@gmail.com"
    fileprivate let validName = "Isaac"
    fileprivate let invalidName = "Isaac24"
    fileprivate let invalidPassword = "1234"
    fileprivate let validPassword = "123456"

    override func setUpWithError() throws {
        inputValidator = InputValidatorImpl()
    }

    override func tearDownWithError() throws {
        inputValidator = nil
    }
    
    func testEmailValidationReturnsEmailValidationType() {
        let result = inputValidator.validateEmailAddress(email: invalidEmail)
        
        XCTAssertTrue(result.validationType == .email)
    }

    func testInvalidEmailFailsValidation() {
        let result = inputValidator.validateEmailAddress(email: invalidEmail)
        
        XCTAssertFalse(result.isValid)
    }
    
    func testInvalidEmailReturnsAValidationMessage() {
        let result = inputValidator.validateEmailAddress(email: invalidEmail)
        
        XCTAssertTrue(result.message.rawValue.isNotEmpty)
    }
    
    func testValidEmailPassesValidation() {
        let result = inputValidator.validateEmailAddress(email: validEmail)
        
        XCTAssertTrue(result.isValid)
    }
    
    func testValidEmailReturnsEmptyValidationMessage() {
        let result = inputValidator.validateEmailAddress(email: validEmail)
        
        XCTAssertTrue(result.message == .empty)
        XCTAssertTrue(result.message.rawValue.isEmpty)
    }
    
    func testNameValidationReturnsNameValidationType() {
        let result = inputValidator.validateName(name: invalidName)
        
        XCTAssertTrue(result.validationType == .name)
    }
    
    func testInvalidNameFailsValidation() {
        let result = inputValidator.validateName(name: invalidName)
        
        XCTAssertFalse(result.isValid)
    }
    
    func testInvalidNameReturnsNonEmptyValidationMessage() {
        let result = inputValidator.validateName(name: invalidName)
        
        XCTAssertTrue(result.message.rawValue.isNotEmpty)
    }
    
    func testValidNamePassesValidation() {
        let result = inputValidator.validateName(name: validName)
        
        XCTAssertTrue(result.isValid)
    }
    
    func testValidNameReturnsEmptyValidationMessage() {
        let result = inputValidator.validateName(name: validName)
        
        XCTAssertTrue(result.message == .empty)
        XCTAssertTrue(result.message.rawValue.isEmpty)
    }
    
    func testPasswordValidationReturnsPasswordValidationType() {
        let result = inputValidator.validatePassword(password: invalidPassword)
        
        XCTAssertTrue(result.validationType == .password)
    }
    
    func testInvalidPasswordFailsValidation() {
        let result = inputValidator.validatePassword(password: invalidPassword)
        
        XCTAssertFalse(result.isValid)
    }
    
    func testInvalidPasswordReturnsNonEmptyValidationMessage() {
        let result = inputValidator.validatePassword(password: invalidPassword)
        
        XCTAssertTrue(result.message.rawValue.isNotEmpty)
    }
    
    func testValidPasswordPassesValidation() {
        let result = inputValidator.validatePassword(password: validPassword)
        
        XCTAssertTrue(result.isValid)
    }
    
    func testValidPasswordReturnsEmptyValidationMessage() {
        let result = inputValidator.validatePassword(password: validPassword)
        
        XCTAssertTrue(result.message == .empty)
        XCTAssertTrue(result.message.rawValue.isEmpty)
    }
    
    func testConfirmPasswordReturnsConfirmPasswordValidationType() {
        let result = inputValidator.validateConfirmPassword(password: invalidPassword, confirmPassword: invalidPassword)
        
        XCTAssertTrue(result.validationType == .confirmPassword)
    }
    
    func testConfirmPasswordFailsValidation() {
        let result = inputValidator.validateConfirmPassword(password: invalidPassword, confirmPassword: validPassword)
        
        XCTAssertFalse(result.isValid)
    }
    
    func testConfirmPasswordReturnsNonEmptyValidationMessage() {
        let result = inputValidator.validateConfirmPassword(password: invalidPassword, confirmPassword: validPassword)
        
        XCTAssertTrue(result.message.rawValue.isNotEmpty)
    }
    
    func testConfirmPasswordPassesValidation() {
        let result = inputValidator.validateConfirmPassword(password: validPassword, confirmPassword: validPassword)
        
        XCTAssertTrue(result.isValid)
    }
    
    func testConfirmPasswordReturnsEmptyValidationMessage() {
        let result = inputValidator.validateConfirmPassword(password: validPassword, confirmPassword: validPassword)
        
        XCTAssertTrue(result.message == .empty)
        XCTAssertTrue(result.message.rawValue.isEmpty)
    }

}

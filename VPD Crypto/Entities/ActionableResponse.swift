//
//  ActionableResponse.swift
//  24 Heights Service Provider
//
//  Created by Isaac Iniongun on 01/01/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct ActionableResponse<T: Codable>: Codable {
    let status, responseCode, responseMessage: String
    var data: T? = nil
    
    var isSuccessful: Bool { responseCode == "00" }
    
    var accountNotVerified: Bool { responseMessage.contains("Account has not been verified") }
    
}

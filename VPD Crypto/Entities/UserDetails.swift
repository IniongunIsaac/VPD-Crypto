//
//  UserResponse.swift
//  Spottr
//
//  Created by Isaac Iniongun on 05/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct UserDetails: Codable, Scopable {
    let status, responseCode, responseMessage: String
    let user: User?
    
    var isSuccessful: Bool { responseCode == "00" }
    
    var accountNotVerified: Bool { responseMessage.contains("Account has not been verified") }
    
    enum CodingKeys: String, CodingKey {
        case status, responseCode, responseMessage
        case user = "data"
    }
}

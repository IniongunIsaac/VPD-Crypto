//
//  User.swift
//  Spottr
//
//  Created by Isaac Iniongun on 05/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct User: Codable, Scopable {
    let riderID: Int
    let name, emailAddress: String
    let address, profileImageURL: String?
    let phoneNumber: String
    let walletID: Int
    let walletBalance: Double
    let rideRequest: [RideRequest]?
    
    enum CodingKeys: String, CodingKey {
        case riderID = "riderId"
        case name, address
        case profileImageURL = "profileImageUrl"
        case emailAddress, phoneNumber
        case walletID = "walletId"
        case walletBalance, rideRequest
    }
}

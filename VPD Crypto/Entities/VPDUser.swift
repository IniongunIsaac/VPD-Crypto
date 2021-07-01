//
//  VPDUser.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 01/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct VPDUser: Codable, Scopable {
    let fullname: String
    let email: String
    var btcBalance: Double { Double.random(in: 10000...100000) }
    var ethBalance: Double { Double.random(in: 10000...100000) }
}

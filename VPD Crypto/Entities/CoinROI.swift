//
//  CoinROI.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 01/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct CoinROI: Codable, Scopable {
    let times: Double
    let currency: String
    let percentage: Double
}

//
//  ProviderType.swift
//  24 Heights Service Provider
//
//  Created by Isaac Iniongun on 01/01/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct ProviderType: Codable, Scopable {
    let id: Int
    let name, description_: String
    let active: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "serviceProviderTypeId"
        case name
        case description_ = "description"
        case active
    }
}

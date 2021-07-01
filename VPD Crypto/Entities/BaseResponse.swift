//
//  BaseResponse.swift
//  Spottr
//
//  Created by Isaac Iniongun on 05/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let code, shortDescription: String
    var data: T? = nil
    
    enum CodingKeys: String, CodingKey {
        case code, shortDescription
        case data = "object"
    }
}

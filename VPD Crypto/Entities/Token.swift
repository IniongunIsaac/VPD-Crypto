//
//  Token.swift
//  24 Heights Service Provider
//
//  Created by Isaac Iniongun on 01/01/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct Token: Codable, Scopable {
    let token, refreshToken, expires: String
    
    var expiryDate: Date {
        //token.expires = 2020-12-21T13:08:04.5251527+00:00
        let dateComps = expires.components(separatedBy: "T")[0].components(separatedBy: "-")
        let timeComps = expires.components(separatedBy: "T")[1].components(separatedBy: ".")[0].components(separatedBy: ":")
        
        return Calendar.current.date(from: DateComponents(year: dateComps[0].int, month: dateComps[1].int, day: dateComps[2].int, hour: timeComps[0].int, minute: timeComps[1].int, second: timeComps[2].int)) ?? Date()
    }
}

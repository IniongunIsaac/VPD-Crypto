//
//  RemoteDataSourceConstants.swift
//  Spottr
//
//  Created by Isaac Iniongun on 04/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct RemoteDataSourceConstants {
    
    static let USERS_COLLECTION = "users"
    
    static let COINS_COLLECTION = "coins"
    
    struct Endpoints {
        
        fileprivate static var BASE_URL = AppConstants.Keys.BASE_URL
        
        static let COINS = "\(BASE_URL)coins/markets"
        
    }
    
}

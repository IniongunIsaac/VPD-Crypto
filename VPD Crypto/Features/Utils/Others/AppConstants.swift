//
//  AppConstants.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import UIKit

struct AppConstants {
    static let VALIDATION_TYPE_NOT_APPLICABLE = "Validation type not applicable in this context."
    static let IMPLEMENTATION_COMING_SOON = "Implementation coming soon!"
    static let DATE_FORMAT = "dd MMM yyyy"
    static let cardLength = 20
    static let validityLength = 4
    static let cvvLength = 3
    static let MAX_PHONE_NUMBER_LENGTH = 11
    static let INVALID_INPUT_FIELD = "Invalid input field."
    static let PAYSTACK_URL = "https://paystack.com"
    static let CURRENT_YEAR_LAST_TWO_DIGITS = "\(currentYearLastTwoDigits())"
    static let CURRENT_YEAR_LAST_TWO_DIGITS_PLUS_10 = "\(currentYearLastTwoDigits() + 10)"
    static let DATA_NOT_FOUND = "No data available at the moment!"
    static let OPTION_NOT_APPLICABLE = "Option doesn't apply to this context."
    static let APP_ERROR_CODE = -9999
    
    struct Urls {
        static let TERMS_AND_CONDITIONS = "https://thespottrapp.com/terms"
    }
    
    struct Keys {
        
        static let GOOGLE_API_KEY = getInfoPlistData()!["GOOGLE_API_KEY"] as! String
        
        static let BASE_URL = getInfoPlistData()!["BASE_URL"] as! String
        
    }
    
}

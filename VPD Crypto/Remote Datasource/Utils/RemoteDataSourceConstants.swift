//
//  RemoteDataSourceConstants.swift
//  Spottr
//
//  Created by Isaac Iniongun on 04/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct RemoteDataSourceConstants {
    
    struct Endpoints {
        
        fileprivate static var BASE_URL = AppConstants.Keys.BASE_URL
        
        static var API_TOKEN = "\(BASE_URL)Token"
        
        static var REFRESH_TOKEN = "\(BASE_URL)RefreshToken"
        
        struct Auth {
            
            fileprivate static let AUTH_BASE_URL = "\(BASE_URL)ServiceProvider/"
            
            static let LOGIN = "\(AUTH_BASE_URL)LoginRider"
            
            static let REGISTER = "\(AUTH_BASE_URL)RegisterRider"
            
            static let CHANGE_PASSWORD = "\(AUTH_BASE_URL)ValidateForgotPassword"
            
            static let RESET_PASSWORD = "\(AUTH_BASE_URL)ForgotPassword"
            
            static let VERIFY_OTP = "\(AUTH_BASE_URL)VerifyRider"
            
            static let REQUEST_OTP = "\(AUTH_BASE_URL)RequestOTP"
            
            static let RESEND_OTP = "\(AUTH_BASE_URL)ReSendOTP"
        }
        
        struct Document {
            
            fileprivate static let DOCUMENT_BASE_URL = "\(BASE_URL)ServiceProviderDocument/"
            
            static let ADD_BY_EMAIL = "\(DOCUMENT_BASE_URL)AddRiderDocumentByEmail"
            
            static let ADD_BY_ID = "\(DOCUMENT_BASE_URL)AddRiderDocumentByID"
        }
        
        struct ProviderType {
            
            fileprivate static let PROVIDER_TYPE_BASE_URL = "\(BASE_URL)ServiceProviderType/"
            
            static let GET_TYPES = "\(PROVIDER_TYPE_BASE_URL)GetServiceProviderType"
            
            static let GET_ACTIVE_TYPES = "\(PROVIDER_TYPE_BASE_URL)GetActiveServiceProviderType"
        }
        
    }
    
    struct Credentials {
        static let API_TOKEN_CREDENTIALS = [
            "username": getInfoPlistData()!["API_TOKEN_USERNAME"] as! String,
            "password": getInfoPlistData()!["API_TOKEN_PASSWORD"] as! String
        ]
    }
    
}

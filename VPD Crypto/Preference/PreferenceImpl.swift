//
//  PreferenceImpl.swift
//  Spottr
//
//  Created by Isaac Iniongun on 05/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct PreferenceImpl: IPreference {
    
    fileprivate let userDefs = UserDefaults.standard
    fileprivate let encoder = JSONEncoder()
    fileprivate let decoder = JSONDecoder()
    
    init(){}
    
    var hasSeenOnboarding: Bool {
        get { userDefs.bool(forKey: PreferenceConstants.HAS_SEEN_ONBOARDING) }
        set { userDefs.set(newValue, forKey: PreferenceConstants.HAS_SEEN_ONBOARDING) }
    }
    
    var user: User? {
        get {
            if let userData = userDefs.object(forKey: PreferenceConstants.USER_DETAILS) as? Data {
                return try? decoder.decode(User.self, from: userData)
            }
            return nil
        }
        set {
            if let userData = try? encoder.encode(newValue){
                userDefs.set(userData, forKey: PreferenceConstants.USER_DETAILS )
            }
        }
    }
    
    var token: Token? {
        get {
            if let tokenData = userDefs.object(forKey: PreferenceConstants.TOKEN) as? Data {
                return try? decoder.decode(Token.self, from: tokenData)
            }
            return nil
        }
        set {
            if let tokenData = try? encoder.encode(newValue){
                userDefs.set(tokenData, forKey: PreferenceConstants.TOKEN )
            }
        }
    }
    
}

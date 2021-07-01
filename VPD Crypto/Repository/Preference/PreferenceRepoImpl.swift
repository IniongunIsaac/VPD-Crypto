//
//  PreferenceRepoImpl.swift
//  Food GIG
//
//  Created by Isaac Iniongun on 10/11/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct PreferenceRepoImpl: IPreferenceRepo {
    
    var preference: IPreference
    
    var hasSeenOnboarding: Bool {
        get { preference.hasSeenOnboarding }
        set { preference.hasSeenOnboarding = newValue }
    }
    
    var user: User? {
        get { preference.user }
        set { preference.user = newValue }
    }
    
    var token: Token? {
        get { preference.token }
        set { preference.token = newValue }
    }
    
    var isLoggedIn: Bool { user.isNotNil }
    
}

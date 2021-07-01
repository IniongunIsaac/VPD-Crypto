//
//  OnboardingRepoImpl.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct OnboardingRepoImpl: IOnboardingRepo {
    
    var preference: IPreference!
    
    var hasSeenOnboarding: Bool {
        get { preference.hasSeenOnboarding }
        set { preference.hasSeenOnboarding = newValue }
    }
}

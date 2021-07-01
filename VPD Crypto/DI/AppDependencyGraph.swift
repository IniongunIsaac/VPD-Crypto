//
//  AppDependencyGraph.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import FirebaseAuth

extension SwinjectStoryboard {
    
    public static func setup() {
        
        defaultContainer.register(IPreference.self) { _ in PreferenceImpl(auth: Auth.auth()) }
        
        defaultContainer.register(IInputValidator.self) { _ in InputValidatorImpl() }
        
        AuthDependencyInjections.setup(container: defaultContainer)
        
        DashboardDependencyInjections.setup(container: defaultContainer)
        
    }
    
}

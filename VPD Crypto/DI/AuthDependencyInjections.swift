//
//  AuthDependencyInjections.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

struct AuthDependencyInjections {
    
    static func setup(container: Container) {
        
        container.register(IAuthRemoteDataSource.self) { _ in AuthRemoteDataSourceImpl() }
        
        container.register(IAuthRepo.self) { AuthRepoImpl(authRemoteDataSource: $0.resolve(IAuthRemoteDataSource.self)!) }
        
        container.register(IAuthViewModel.self) {
            AuthViewModelImpl(authRepo: $0.resolve(IAuthRepo.self)!, inputValidator: $0.resolve(IInputValidator.self)!, preferenceRepo: $0.resolve(IPreferenceRepo.self)!)
        }
        
        container.storyboardInitCompleted(AuthOptionsViewController.self) { $1.authViewModel = $0.resolve(IAuthViewModel.self) }

        container.storyboardInitCompleted(LoginViewController.self) { $1.authViewModel = $0.resolve(IAuthViewModel.self) }
        
        container.storyboardInitCompleted(CreateAccountViewController.self) { $1.authViewModel = $0.resolve(IAuthViewModel.self) }
        
    }
    
}

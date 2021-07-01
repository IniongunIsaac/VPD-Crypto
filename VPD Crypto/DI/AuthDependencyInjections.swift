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
import FirebaseAuth
import FirebaseFirestore

struct AuthDependencyInjections {
    
    static func setup(container: Container) {
        
        container.register(IAuthRemoteDataSource.self) { _ in AuthRemoteDataSourceImpl(auth: Auth.auth(), firestore: Firestore.firestore()) }
        
        container.register(IAuthViewModel.self) {
            AuthViewModelImpl(authRemoteDatasource: $0.resolve(IAuthRemoteDataSource.self)!, inputValidator: $0.resolve(IInputValidator.self)!, preference: $0.resolve(IPreference.self)!)
        }

        container.storyboardInitCompleted(LoginViewController.self) { $1.authViewModel = $0.resolve(IAuthViewModel.self) }
        
        container.storyboardInitCompleted(CreateAccountViewController.self) { $1.authViewModel = $0.resolve(IAuthViewModel.self) }
        
    }
    
}

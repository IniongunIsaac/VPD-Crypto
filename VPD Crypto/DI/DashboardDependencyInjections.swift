//
//  DashboardDependencyInjections.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 02/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import FirebaseAuth
import FirebaseFirestore

struct DashboardDependencyInjections {
    
    static func setup(container: Container) {
        
        container.register(IDashboardRemoteDatasource.self) { _ in DashboardRemoteDatasourceImpl(auth: Auth.auth(), firestore: Firestore.firestore()) }
        
        container.register(IDashboardViewModel.self) {
            DashboardViewModelImpl(remoteDatasource: $0.resolve(IDashboardRemoteDatasource.self)!)
        }
        
        container.storyboardInitCompleted(DashboardViewController.self) { $1.dashboardViewModel = $0.resolve(IDashboardViewModel.self) }
        
        container.storyboardInitCompleted(FavoritesViewController.self) { $1.dashboardViewModel = $0.resolve(IDashboardViewModel.self) }
        
        container.storyboardInitCompleted(CoinDetailsViewController.self) { $1.dashboardViewModel = $0.resolve(IDashboardViewModel.self) }
        
    }
    
}

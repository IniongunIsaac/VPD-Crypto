//
//  IDashboardViewModel.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 01/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

protocol IDashboardViewModel: Scopable {
    
    var user: PublishSubject<VPDUser> { get }
    
    var coins: [Coin] { get set }
    
    var showCoins: PublishSubject<Bool> { get }
    
    var hasFetchedCoins: Bool { get set }
    
    var canFetchMoreCoins: Bool { get }
    
    var favoriteCoins: PublishSubject<[Coin]> { get }
    
    var showAuthOptions: PublishSubject<Bool> { get }
    
    /// Get cryptocurrencies
    /// - Parameter isInitial: determines the page number to be used during pagination
    func getCoins(isInitial: Bool)
    
    /// Saves a favorite coin
    /// - Parameter coin: coin to be saved as favorite
    func saveFavoriteCoin(_ coin: Coin)
    
    func getFavoriteCoins()
    
    func signOut()
}

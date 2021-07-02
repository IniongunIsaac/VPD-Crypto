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
    
    func getCoins(isInitial: Bool)
    
    func saveFavoriteCoin(_ coin: Coin)
    
    func getFavoriteCoins()
    
    func signOut()
}

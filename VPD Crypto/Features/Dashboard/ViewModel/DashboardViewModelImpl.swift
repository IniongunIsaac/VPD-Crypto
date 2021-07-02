//
//  DashboardViewModelImpl.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 01/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

class DashboardViewModelImpl: BaseViewModel, IDashboardViewModel {
    
    var showCoins: PublishSubject<Bool> = PublishSubject()
    var hasFetchedCoins = false
    var canFetchMoreCoins: Bool { currentPage < 50 }
    var user: PublishSubject<VPDUser> = PublishSubject()
    var coins: [Coin] = []
    var favoriteCoins: PublishSubject<[Coin]> = PublishSubject()
    var showAuthOptions: PublishSubject<Bool> = PublishSubject()
    
    fileprivate var currentPage = 1
    
    fileprivate let remoteDatasource: IDashboardRemoteDatasource
    
    init(remoteDatasource: IDashboardRemoteDatasource) {
        self.remoteDatasource = remoteDatasource
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        getUserData()
    }
    
    fileprivate func getUserData() {
        subscribeAny(remoteDatasource.getUserData(), success: { [weak self] user in
            self?.user.onNext(user)
        })
    }
    
    func getCoins(isInitial: Bool) {
        if isInitial {
            currentPage = 1
        } else {
            currentPage += 1
        }
        
        let params: BodyParam = [
            "vs_currency": "usd",
            "order": "market_cap_desc",
            "per_page": 10,
            "page": currentPage,
            "sparkline": false
        ]
        
        if canFetchMoreCoins {
            subscribeAny(remoteDatasource.getCoins(params: params), success: { [weak self] coins in
                guard let self = self else { return }
                self.coins += coins
                self.hasFetchedCoins = true
                self.showCoins.onNext(true)
            })
        }
        
    }
    
    func saveFavoriteCoin(_ coin: Coin) {
        subscribeAny(remoteDatasource.saveFavoriteCoin(coin), success: { [weak self] in
            self?.showMessage("Coin added to favorites!")
        })
    }
    
    func getFavoriteCoins() {
        subscribeAny(remoteDatasource.getFavoriteCoins(), success: { [weak self] coins in
            self?.favoriteCoins.onNext(coins)
        })
    }
    
    func signOut() {
        subscribeAny(remoteDatasource.signOut(), success: { [weak self] in
            self?.showAuthOptions.onNext(true)
        })
    }
    
}

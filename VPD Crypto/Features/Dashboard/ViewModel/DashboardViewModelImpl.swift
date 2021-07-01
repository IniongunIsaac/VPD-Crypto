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
    
    var user: PublishSubject<VPDUser> = PublishSubject()
    var coins: [Coin] = []
    
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
    
    func getCoins() {
        
    }
    
}

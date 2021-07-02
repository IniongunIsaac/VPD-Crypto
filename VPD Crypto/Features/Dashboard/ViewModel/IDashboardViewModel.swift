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
    
    func getCoins(isInitial: Bool)
}

//
//  IDashboardRemoteDatasource.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 01/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

protocol IDashboardRemoteDatasource {
    
    func getCoins() -> Observable<[Coin]>
    
    func getUserData() -> Observable<VPDUser>
    
}

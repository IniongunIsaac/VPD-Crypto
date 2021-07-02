//
//  DashboardRemoteDatasourceImpl.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 01/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import Alamofire

class DashboardRemoteDatasourceImpl: BaseRemoteDataSourceImpl, IDashboardRemoteDatasource {
    
    fileprivate var auth: Auth
    fileprivate var firestore: Firestore
    
    init(auth: Auth, firestore: Firestore) {
        self.auth = auth
        self.firestore = firestore
    }
    
    func getCoins(params: BodyParam) -> Observable<[Coin]> {
        makeAPIRequest(responseType: [Coin].self, url: RemoteDataSourceConstants.Endpoints.COINS, params: params, encoding: URLEncoding.default)
    }
    
    func getUserData() -> Observable<VPDUser> {
        firestore.collection(RemoteDataSourceConstants.USERS_COLLECTION).document(auth.currentUser!.uid).rxGetDocument()
    }
    
    func saveFavoriteCoin(_ coin: Coin) -> Observable<Void> {
        firestore.collection(RemoteDataSourceConstants.COINS_COLLECTION).document(coin.id).rxSetData(from: coin)
    }
    
    func getFavoriteCoins() -> Observable<[Coin]> {
        firestore.collection(RemoteDataSourceConstants.COINS_COLLECTION).rxGetDocuments()
    }
}

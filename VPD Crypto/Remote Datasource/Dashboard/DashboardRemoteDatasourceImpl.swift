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

class DashboardRemoteDatasourceImpl: BaseRemoteDataSourceImpl, IDashboardRemoteDatasource {
    
    fileprivate var auth: Auth
    fileprivate var firestore: Firestore
    
    init(auth: Auth, firestore: Firestore) {
        self.auth = auth
        self.firestore = firestore
    }
    
    func getCoins() -> Observable<[Coin]> {
        makeAPIRequest(responseType: [Coin].self, url: RemoteDataSourceConstants.Endpoints.COINS)
    }
    
    func getUserData() -> Observable<VPDUser> {
        return firestore.collection(RemoteDataSourceConstants.USERS_COLLECTION).document(auth.currentUser!.uid).rxGetDocument()
    }
}

//
//  AuthRemoteDataSourceImpl.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class AuthRemoteDataSourceImpl: IAuthRemoteDataSource {
    
    fileprivate var auth: Auth
    fileprivate var firestore: Firestore
    
    init(auth: Auth, firestore: Firestore) {
        self.auth = auth
        self.firestore = firestore
    }
    
    func signUp(email: String, password: String) -> Observable<AuthDataResult> {
        return Observable.create { [weak self] observer in
            self?.auth.createUser(withEmail: email, password: password) { authDataRes, error in
                if let error = error {
                    observer.onError(error)
                } else if let authDataRes = authDataRes {
                    observer.onNext(authDataRes)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
    
    func signIn(email: String, password: String) -> Observable<AuthDataResult> {
        return Observable.create { [weak self] observer in
            self?.auth.signIn(withEmail: email, password: password) { authDataRes, error in
                if let error = error {
                    observer.onError(error)
                } else if let authDataRes = authDataRes {
                    observer.onNext(authDataRes)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
    
    func saveUserData(user: VPDUser) -> Observable<Void> {
        return firestore.collection(RemoteDataSourceConstants.USERS_COLLECTION).document(auth.currentUser!.uid).rxSetData(from: user)
    }
    
}

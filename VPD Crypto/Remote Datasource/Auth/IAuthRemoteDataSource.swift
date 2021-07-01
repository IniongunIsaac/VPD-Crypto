//
//  IAuthRemoteDataSource.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift
import FirebaseAuth

protocol IAuthRemoteDataSource {
    
    func signUp(email: String, password: String) -> Observable<AuthDataResult>
    
    func signIn(email: String, password: String) -> Observable<AuthDataResult>
    
    func saveUserData(user: VPDUser) -> Observable<Void>
    
}

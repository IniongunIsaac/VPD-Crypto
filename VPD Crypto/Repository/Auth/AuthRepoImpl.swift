//
//  AuthRepoImpl.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

struct AuthRepoImpl: IAuthRepo {
    
    let authRemoteDataSource: IAuthRemoteDataSource
    
    func getToken() -> Observable<BaseResponse<Token>> {
        authRemoteDataSource.getToken()
    }
    
    func refreshToken() -> Observable<BaseResponse<Token>> {
        authRemoteDataSource.refreshToken()
    }
    
    func login(body: BodyParam) -> Observable<AuthRes> {
        authRemoteDataSource.login(body: body)
    }
    
    func register(body: BodyParam) -> Observable<AuthRes> {
        authRemoteDataSource.register(body: body)
    }
    
    func changePassword(body: BodyParam) -> Observable<AuthRes> {
        authRemoteDataSource.changePassword(body: body)
    }
    
    func resetPassword(body: BodyParam) -> Observable<AuthRes> {
        authRemoteDataSource.resetPassword(body: body)
    }
    
    func verifyOTP(body: BodyParam) -> Observable<AuthRes> {
        authRemoteDataSource.verifyOTP(body: body)
    }
    
    func requestOTP(body: BodyParam) -> Observable<AuthRes> {
        authRemoteDataSource.requestOTP(body: body)
    }
    
    func resendOTP(body: BodyParam) -> Observable<AuthRes> {
        authRemoteDataSource.resendOTP(body: body)
    }
    
    func getActiveProviderTypes() -> Observable<BaseResponse<[ProviderType]>> {
        authRemoteDataSource.getActiveProviderTypes()
    }
    
    func uploadDocuments(data: [String : Data]) -> Observable<AuthRes> {
        authRemoteDataSource.uploadDocuments(data: data)
    }
}

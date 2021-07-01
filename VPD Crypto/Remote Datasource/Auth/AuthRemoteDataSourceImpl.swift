//
//  AuthRemoteDataSourceImpl.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class AuthRemoteDataSourceImpl: BaseRemoteDataSourceImpl, IAuthRemoteDataSource {
    
    func getToken() -> Observable<BaseResponse<Token>> {
        makeAPIRequest(responseType: BaseResponse<Token>.self, url: RemoteDataSourceConstants.Endpoints.API_TOKEN, method: .post, params: RemoteDataSourceConstants.Credentials.API_TOKEN_CREDENTIALS)
    }
    
    func refreshToken() -> Observable<BaseResponse<Token>> {
        makeAPIRequest(responseType: BaseResponse<Token>.self, url: RemoteDataSourceConstants.Endpoints.REFRESH_TOKEN, method: .post, params: RemoteDataSourceConstants.Credentials.API_TOKEN_CREDENTIALS)
    }
    
    func login(body: BodyParam) -> Observable<AuthRes> {
        makeAPIRequest(responseType: AuthRes.self, url: RemoteDataSourceConstants.Endpoints.Auth.LOGIN, method: .post, params: body)
    }
    
    func register(body: BodyParam) -> Observable<AuthRes> {
        makeAPIRequest(responseType: AuthRes.self, url: RemoteDataSourceConstants.Endpoints.Auth.REGISTER, method: .post, params: body)
    }
    
    func changePassword(body: BodyParam) -> Observable<AuthRes> {
        makeAPIRequest(responseType: AuthRes.self, url: RemoteDataSourceConstants.Endpoints.Auth.CHANGE_PASSWORD, method: .post, params: body)
    }
    
    func resetPassword(body: BodyParam) -> Observable<AuthRes> {
        makeAPIRequest(responseType: AuthRes.self, url: RemoteDataSourceConstants.Endpoints.Auth.RESET_PASSWORD, method: .post, params: body)
    }
    
    func verifyOTP(body: BodyParam) -> Observable<AuthRes> {
        makeAPIRequest(responseType: AuthRes.self, url: RemoteDataSourceConstants.Endpoints.Auth.VERIFY_OTP, method: .post, params: body)
    }
    
    func requestOTP(body: BodyParam) -> Observable<AuthRes> {
        makeAPIRequest(responseType: AuthRes.self, url: RemoteDataSourceConstants.Endpoints.Auth.REQUEST_OTP, method: .post, params: body)
    }
    
    func resendOTP(body: BodyParam) -> Observable<AuthRes> {
        makeAPIRequest(responseType: AuthRes.self, url: RemoteDataSourceConstants.Endpoints.Auth.RESEND_OTP, method: .post, params: body)
    }
    
    func getActiveProviderTypes() -> Observable<BaseResponse<[ProviderType]>> {
        makeAPIRequest(responseType: BaseResponse<[ProviderType]>.self, url: RemoteDataSourceConstants.Endpoints.ProviderType.GET_ACTIVE_TYPES, method: .get)
    }
    
    func uploadDocuments(data: [String : Data]) -> Observable<AuthRes> {
        makeMultipartFormDataRequest(responseType: AuthRes.self, url: RemoteDataSourceConstants.Endpoints.Document.ADD_BY_EMAIL, data: data)
    }
    
}

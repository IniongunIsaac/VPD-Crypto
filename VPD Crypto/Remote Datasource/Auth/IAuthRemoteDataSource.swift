//
//  IAuthRemoteDataSource.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

protocol IAuthRemoteDataSource {
 
    func getToken() -> Observable<BaseResponse<Token>>
    
    func refreshToken() -> Observable<BaseResponse<Token>>
    
    func login(body: BodyParam) -> Observable<AuthRes>
    
    func register(body: BodyParam) -> Observable<AuthRes>
    
    func changePassword(body: BodyParam) -> Observable<AuthRes>
    
    func resetPassword(body: BodyParam) -> Observable<AuthRes>
    
    func verifyOTP(body: BodyParam) -> Observable<AuthRes>
    
    func requestOTP(body: BodyParam) -> Observable<AuthRes>
    
    func resendOTP(body: BodyParam) -> Observable<AuthRes>
    
    func getActiveProviderTypes() -> Observable<BaseResponse<[ProviderType]>>
    
    func uploadDocuments(data: [String : Data]) -> Observable<AuthRes>
    
}

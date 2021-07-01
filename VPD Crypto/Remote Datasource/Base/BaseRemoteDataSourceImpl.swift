//
//  BaseRemoteDataSourceImpl.swift
//  Spottr
//
//  Created by Isaac Iniongun on 05/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

class BaseRemoteDataSourceImpl: IBaseRemoteDataSource {
    
    fileprivate let disposeBag = DisposeBag()
    fileprivate let preference: IPreference = PreferenceImpl()
    fileprivate let manager = Session.default
    fileprivate lazy var headers: HTTPHeaders = {
        [.authorization(bearerToken: preference.token?.token ?? "")]
    }()
    
    func makeAPIRequest<T>(responseType: T.Type, url: String, method: HTTPMethod = .get, params: [String : Any]? = nil, encoding: ParameterEncoding = JSONEncoding.default) -> Observable<T> where T : Decodable, T : Encodable {
        
        return manager.rx.request(method, url, parameters: params, encoding: encoding, headers: headers)
            .validate(statusCode: 200 ..< 499)
            .debug()
            .responseString()
            .flatMap { (_, responseString) -> Observable<T> in
                do {
                    
                    printIfDebugOrStagingScheme("Request URL: \(url)", .info)
                    printIfDebugOrStagingScheme("Request Parameters:\n \(String(describing: params))", .info)
                    printIfDebugOrStagingScheme(responseString, .info)
                    
                    //map the result of `responseString` above to the `responseType`
                    let requestResponse = try responseType.mapTo(jsonString: responseString)!
                    printIfDebugOrStagingScheme(requestResponse.prettyPrinted, .success, isJsonResponse: true)
                    //return result in `requestResponse` above in the `successHandler`
                    return Observable.just(requestResponse)
                    
                } catch let error {
                    printIfDebugOrStagingScheme(error)
                    throw error
                }
        }
        .observeOn(MainScheduler.instance)
        
    }
    
    func makeMultipartFormDataRequest<T: Codable>(responseType: T.Type, url: String, method: HTTPMethod = .post, data: [String : Data])  -> Observable<T> {
        return Observable<T>.create({ observer in
            AF.upload(multipartFormData: { multipartFormData in
            for (key, value) in data {
                multipartFormData.append(value, withName: key)
            }}, to: url, method: method, headers: self.headers).responseDecodable(of: T.self) { response in
                printIfDebugOrStagingScheme("Request URL: \(url)", .info)
                if let value = response.value {
                    printIfDebugOrStagingScheme(value.prettyPrinted, .success, isJsonResponse: true)
                    observer.onNext(value)
                } else {
                    if let error = response.error {
                        printIfDebugOrStagingScheme(error, .error)
                        observer.onError(error)
                    }
                }
                observer.onCompleted()
            }
            return Disposables.create()
        })
    }
    
}

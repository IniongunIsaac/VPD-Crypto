//
//  RemoteDataSource+Extensions.swift
//  Spottr
//
//  Created by Isaac Iniongun on 05/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

typealias BodyParam = [String : Any]

typealias AuthRes = BaseResponse<ActionableResponse<User>>

typealias ObservableBaseRes<T: Codable> = Observable<BaseResponse<T>>

extension AuthRes {
    var type: BaseResponse<ActionableResponse<User>>.Type {
        BaseResponse<ActionableResponse<User>>.self
    }
}

extension Decodable {
    ///Maps JSON String to actual Decodable Object
    ///throws an exception if mapping fails
    static func mapTo(jsonString: String) throws -> Self? {
        
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(Self.self, from: Data(jsonString.utf8))
    }
    
    static func map(from data: Data) throws -> Self? {
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}

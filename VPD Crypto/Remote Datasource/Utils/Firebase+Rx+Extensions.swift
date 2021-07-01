//
//  Firebase+Rx+Extensions.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 01/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import FirebaseFirestore
import RxSwift
import FirebaseFirestoreSwift

extension DocumentReference {
    
    func rxSetData<T: Codable>(from data: T) -> Observable<Void> {
        return Observable<Void>.create { observer in
            
            do {
                try self.setData(from: data) { error in
                    guard let error = error else {
                        observer.onNext(())
                        observer.onCompleted()
                        return
                    }
                    observer.onError(error)
                }
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create()
        }
    }
    
    func rxGetDocument<T: Codable>() -> Observable<T> {
        return Observable.create { observer in
            self.getDocument { snapshot, error in
                if let error = error {
                    observer.onError(error)
                } else if let snapshot = snapshot, snapshot.exists {
                    
                    let result = Result {
                        try snapshot.data(as: T.self)!
                    }
                    
                    switch result {
                    case .success(let doc):
                        observer.onNext(doc)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                } else {
                    observer.onError(NSError(domain: FirestoreErrorDomain, code: FirestoreErrorCode.notFound.rawValue, userInfo: nil))
                }
            }
            return Disposables.create()
        }
    }
    
}

extension Query {
    
    func rxGetDocuments<T: Codable>() -> Observable<[T]> {
        
        return Observable<[T]>.create { observer in
            
            self.getDocuments { snapshot, error in
                
                if let error = error {
                    observer.onError(error)
                } else if let snapshot = snapshot {
                    
                    let result = Result {
                        try snapshot.documents.compactMap {
                            try $0.data(as: T.self)
                        }
                    }
                    
                    switch result {
                    case .success(let docs):
                        observer.onNext(docs)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                }
            }
            return Disposables.create()
        }
        
    }
    
}

extension Firestore {
    
    func rxRunTransaction<T>(type: T.Type, _ updateBlock: @escaping (Transaction) throws -> T?) -> Observable<T?> {
        return Observable.create { observer in
            self.runTransaction({ transaction, errorPointer in
                do {
                    return try updateBlock(transaction)
                } catch {
                    errorPointer?.pointee = error as NSError
                    return nil
                }
            }, completion: { value, error in
                guard let error = error else {
                    observer.onNext(value as? T)
                    observer.onCompleted()
                    return
                }
                observer.onError(error)
            })
            return Disposables.create()
        }
    }
    
}

//
//  DBRepositoryImpl.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/21.
//

import Combine
import FirebaseFirestore
import Foundation

// swiftlint:disable missing_docs
internal struct DBRepositoryImpl: DBRepository {
    
    @Inject private var database: Firestore

    internal func createUser(uid: String, name: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Future<Void, Error> { promise in
                database.collection("users").document(uid).setData(["name": name]) { error in
                    if let error = error {
                        promise(.failure(error))
                    }
                    promise(.success(()))
                }
            }
        }.eraseToAnyPublisher()
    }
}

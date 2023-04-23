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

    internal func createUser(uid: String, name: String) -> AnyPublisher<Void, DBError> {
        Deferred {
            Future<Void, DBError> { promise in
                database.collection("users").document(uid).setData(["name": name]) { error in
                    if error != nil  {
                        // エラーが発生した場合は一旦識別せず予期せぬエラーを固定で返却する
                        promise(.failure(DBError.unexpected))
                    }
                    promise(.success(()))
                }
            }
        }.eraseToAnyPublisher()
    }
}

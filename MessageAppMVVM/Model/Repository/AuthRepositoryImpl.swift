//
//  AuthRepositoryImpl.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/17.
//

import Combine
import FirebaseAuth
import Foundation

// swiftlint:disable missing_docs
internal struct AuthRepositoryImpl: AuthRepository {

    @Inject private var auth: Auth

    internal func createUserWithEmailAndPassword(email: String, password: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                auth.createUser(withEmail: email, password: password) { _, error in
                    if let error = error {
                        promise(.failure(error))
                        return
                    }
                    promise(.success(()))
                }
            }
        }.eraseToAnyPublisher()
    }

    internal func signOut() -> AnyPublisher<Void, Error> {
        do {
            try auth.signOut()
            return Empty().eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}

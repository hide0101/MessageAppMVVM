//
//  SignUpImpl.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/26.
//

import Combine
import Foundation
import FirebaseAuth
import FirebaseFirestore

internal struct SignUpImpl: SignUp {
    @Inject private var authRepository: AuthRepository
    @Inject private var dbRepository: DBRepository
    
    func execute(name: String, email: String, password: String) -> AnyPublisher<ResultData<SignUpStatus>, Never> {
        authRepository.createUserWithEmailAndPassword(email: email, password: password)
            .flatMap { result -> AnyPublisher<Void, Error> in
                if let result = result {
                    return dbRepository.createUser(uid: result.user.uid, name: name)
                }
                return Fail(error: NSError(domain: "An unexpected error has occurred.", code: -1, userInfo: nil)).eraseToAnyPublisher()
            }
            .map { result -> ResultData<SignUpStatus> in
                return ResultData(status: SignUpStatus.success)
            }
            .catch({ error -> AnyPublisher<ResultData<SignUpStatus>, Never> in
                return Just(ResultData(status: SignUpStatus.networkError)).eraseToAnyPublisher()
            })
            .eraseToAnyPublisher()
    }
    
}

internal struct ResultData<T> {
    internal let status: T
    internal let data: Codable?
    
    internal init(status: T, data: Codable? = nil) {
        self.status = status
        self.data = data
    }
}

internal enum SignUpStatus {
    case success
    case networkError
    case emailAlReadyInUse
    case weakPassword
    case invalidEmail
    case unexpectedError
}

//
//  SignUpImpl.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/26.
//

import Combine
import FirebaseAuth
import FirebaseFirestore
import Foundation

internal struct SignUpImpl: SignUp {
    
    @Inject private var authRepository: AuthRepository
    @Inject private var dbRepository: DBRepository
    
    internal func execute(name: String, email: String, password: String) -> AnyPublisher<ResultData<SignUpStatus>, Never> {
        authRepository.createUserWithEmailAndPassword(email: email, password: password)
            .mapError { $0 as Error }
            .flatMap { result -> AnyPublisher<Void, Error> in
                if let result = result {
                    return dbRepository.createUser(uid: result.user.uid, name: name)
                }
                return Fail(error: AuthError.unexpected).eraseToAnyPublisher()
            }
            .map { result -> ResultData<SignUpStatus> in
                return ResultData(status: SignUpStatus.success)
            }
            .catch({ error -> AnyPublisher<ResultData<SignUpStatus>, Never> in
                switch error  {
                case let error as AuthError:
                    if case .invalidEmail = error {
                        return Just(ResultData(status: SignUpStatus.emailAlReadyInUse)).eraseToAnyPublisher()
                    }
                    if case .emailAlreadyInUse = error {
                        return Just(ResultData(status: SignUpStatus.weakPassword)).eraseToAnyPublisher()
                    }
                    if case .weakPasssword = error {
                        return Just(ResultData(status: SignUpStatus.weakPassword)).eraseToAnyPublisher()
                    }
                    if case .unexpected = error {
                        return Just(ResultData(status: SignUpStatus.unexpectedError)).eraseToAnyPublisher()
                    }
                default:
                    return Just(ResultData(status: SignUpStatus.networkError)).eraseToAnyPublisher()
                }
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

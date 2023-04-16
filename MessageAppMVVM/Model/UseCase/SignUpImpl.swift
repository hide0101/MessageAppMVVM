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

/// SignUpを実行するUseCase
internal struct SignUpImpl: SignUp {
    /// AuthRepository
    @Inject private var authRepository: AuthRepository
    /// DBRepository
    @Inject private var dbRepository: DBRepository
    /// 実行
    /// - Parameters:
    ///     - name: ユーザー名
    ///     - email: メールアドレス
    ///     - password: パスワード
    /// - Returns:
    ///     ResultData
    internal func execute(
        name: String,
        email: String,
        password: String
    ) -> AnyPublisher<ResultData<SignUpStatus>, Never> {
        authRepository.createUserWithEmailAndPassword(email: email, password: password)
            .mapError { $0 as Error }
            .flatMap { result -> AnyPublisher<Void, Error> in
                if let result = result {
                    return dbRepository.createUser(uid: result.user.uid, name: name)
                        .mapError { $0 as Error }
                        .eraseToAnyPublisher()
                }
                return Fail(error: AuthError.unexpected).eraseToAnyPublisher()
            }
            .map { _ -> ResultData<SignUpStatus> in
                ResultData(status: SignUpStatus.success)
            }
            .catch({ error -> AnyPublisher<ResultData<SignUpStatus>, Never> in
                Just(handleError(error: error)).eraseToAnyPublisher()
            })
            .eraseToAnyPublisher()
    }

    /// エラーを識別し該当するResultDataを返却する
    /// - Parameters:
    ///     - error: エラー
    /// - Returns:
    ///     ResultData
    private func handleError(error: Error) -> ResultData<SignUpStatus> {
        switch error {
        case let error as AuthError:
            if case .invalidEmail = error {
                return ResultData(status: SignUpStatus.invalidEmail)
            } else if case .emailAlreadyInUse = error {
                return ResultData(status: SignUpStatus.emailAlReadyInUse)
            } else if case .weakPasssword = error {
                return ResultData(status: SignUpStatus.weakPassword)
            } else if case .unexpected = error {
                return ResultData(status: SignUpStatus.unexpectedError)
            }
            return ResultData(status: SignUpStatus.networkError)
        case let error as DBError:
            if case .unexpected = error {
                return ResultData(status: SignUpStatus.unexpectedError)
            }
            return ResultData(status: SignUpStatus.networkError)
        default:
            return ResultData(status: SignUpStatus.unexpectedError)
        }
    }
}

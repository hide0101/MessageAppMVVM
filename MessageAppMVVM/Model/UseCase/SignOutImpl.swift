//
//  SignOutImpl.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/04/30.
//

import Combine
import Foundation

/// SignOutを実行するUseCase
internal struct SignOutImpl: SignOut {
    /// AuthRepository
    @Inject private var authRepository: AuthRepository

    /// 実行
    ///  - Returns:
    ///     ResultData
    internal func execute() -> AnyPublisher<ResultData<SignOutStatus>, Never> {
        authRepository.signOut()
            .map { _ -> ResultData<SignOutStatus> in
                ResultData(status: SignOutStatus.success)
            }
            .catch({ _ -> AnyPublisher<ResultData<SignOutStatus>, Never> in
                Just(ResultData(status: SignOutStatus.unexpectedError)).eraseToAnyPublisher()
            })
            .eraseToAnyPublisher()
    }
}

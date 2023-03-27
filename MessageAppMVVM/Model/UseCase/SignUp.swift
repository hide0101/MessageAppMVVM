//
//  SignUp.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/26.
//

import Combine
import Foundation

/// サインアップするUseCase
internal protocol SignUp {
    /// 実行
    /// - Parameters:
    ///     - email: メールアドレス
    ///     - password: パスワード
    func execute(email: String, password: String) -> AnyPublisher<ResultData<SignUpStatus>, Never>
}

//
//  AuthRepository.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/17.
//

import Combine
import Foundation

/// 認証情報を操作するRepository
/// @mockable
internal protocol AuthRepository {
    /// メールアドレスでアカウントを作成する
    /// - Parameters:
    ///     - email: メールアドレス
    ///     - password: パスワード
    /// - Returns:
    ///     ユーザーの作成が成功した場合はVoid, 失敗した場合はエラーを返す
    func createUserWithEmail(email: String, password: String) -> AnyPublisher<Void, Error>
}

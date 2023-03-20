//
//  AuthRepository.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/17.
//

import Combine
import FirebaseAuth
import Foundation

/// 認証情報を操作するRepository
/// @mockable
internal protocol AuthRepository {
    /// メールアドレスでアカウントを作成する
    /// - Parameters:
    ///     - email: メールアドレス
    ///     - password: パスワード
    /// - Returns:
    ///     ユーザーの作成が成功した場合はAuthDataResult?, 失敗した場合はエラーを返す
    func createUserWithEmailAndPassword(email: String, password: String) -> AnyPublisher<AuthDataResult?, Error>
    /// メールアドレスでサインインする
    /// - Parameters:
    ///     - email: メールアドレス
    ///     - password: パスワード
    /// - Returns:
    ///     サインインが成功した場合はAuthDataResult?, 失敗した場合はエラーを返す
    func signInWithEmailAndPassword(email: String, password: String) -> AnyPublisher<AuthDataResult?, Error>
    /// サインアウトする
    func signOut() -> AnyPublisher<Void, Error>
}

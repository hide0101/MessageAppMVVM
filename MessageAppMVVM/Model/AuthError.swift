//
//  AuthError.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/28.
//

import Foundation

/// 認証のエラー種別
internal enum AuthError: Error {
    /// メールアドレスの形式が正しくない
    case invalidEmail
    /// メールアドレスがすでに使用されている
    case emailAlreadyInUse
    /// パスワードの強度が弱い
    case weakPasssword
    /// 予期せぬエラー
    case unexpected
}

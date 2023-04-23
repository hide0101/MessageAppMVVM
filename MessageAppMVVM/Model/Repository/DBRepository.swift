//
//  DBRepository.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/21.
//

import Combine
import Foundation

/// DataBaseを管理するRepository
/// @mockable
internal protocol DBRepository {
    /// ユーザーを作成する
    /// - Parameters:
    ///     - uid: uid
    ///     - name: ユーザー名
    /// - Returns:
    ///     ユーザーの作成が成功した場合はVoid, 失敗した場合はエラーを返す
    func createUser(uid: String, name: String) -> AnyPublisher<Void, DBError>
}

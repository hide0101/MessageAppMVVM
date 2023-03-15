//
//  FetchAppVersion.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/15.
//

import Foundation

/// アプリのバージョンを取得するUseCase
/// @mockable
internal protocol FetchAppVersion {
    /// 実行
    /// - Returns: アプリバージョン
    func invoke() -> String
}

//
//  FetchAppVersion.swift
//  MessageAppMVVM
//
//  Created by hideaki komori on 2023/03/15.
//

import Foundation

/// アプリのバージョンを取得するUseCase
internal protocol FetchAppVersion {
    /// 実行
    /// - Returns: アプリバージョン
    func invoke() -> String
}

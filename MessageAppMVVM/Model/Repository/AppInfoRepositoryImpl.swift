//
//  AppInfoRepositoryImpl.swift
//  MessageAppMVVM
//
//  Created by hideaki komori on 2023/03/10.
//

import Foundation

/// アプリ情報を管理するRepository
internal struct AppInfoRepositoryImpl: AppInfoRepository {
    /// Bundle
    private let bundle: Bundle
    /// アプリバージョン
    internal var appVersion: String {
        guard let version = bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            return ""
        }
        return version
    }
}

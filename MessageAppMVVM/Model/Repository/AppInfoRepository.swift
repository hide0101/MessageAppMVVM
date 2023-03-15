//
//  AppInfoRepository.swift
//  MessageAppMVVM
//
//  Created by hideaki komori on 2023/03/10.
//

import Foundation


/// アプリ情報を管理するRepository
/// @mockable
internal protocol AppInfoRepository {
    /// アプリバージョン
    var appVersion: String { get }
}

//
//  ContainerResolver.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/11.
//

import Foundation

/// ContainerResolver
internal class ContainerResolver {
    /// ContainerResolverのシングルトンインスタンス
    internal static let shared = ContainerResolver()
    /// インスタンスが注入済みのコンテナ
    private var injectedContainer = MessageAppMVVMApp.buildContainer()

    private init() {
    }

    /// 指定したタイプのインスタンスをコンテナから解決(取得)する
    /// - Parameters:
    ///   - type: 解決するインスタンスのタイプ
    /// - Returns: 解決されたインスタンス
    internal func resolve<T>(_ type: T.Type) -> T {
        // swiftlint:disable force_unwrapping
        injectedContainer.resolve(T.self)!
    }
}

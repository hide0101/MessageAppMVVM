//
//  ContainerResolver.swift
//  MessageAppMVVM
//
//  Created by hideaki komori on 2023/03/11.
//

import Foundation

/// ContainerResolver
internal class ContainerResolver {
    /// ContainerResolverのシングルトンインスタンス
    internal static let shared = ContainerResolver()
    /// インスタンスが注入済みのコンテナ
    private var injectedContainer = MessageAppMVVMApp.buildContainer()

    /// 指定したタイプのインスタンスをコンテナから解決(取得)する
    /// - Parameters:
    ///   - type: 解決するインスタンスのタイプ
    /// - Returns: 解決されたインスタンス
    internal func resolve<T>(_ type: T.Type) -> T {
        injectedContainer.resolve(T.self)!
    }
}

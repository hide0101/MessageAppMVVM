//
//  ContainerResolver.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/11.
//

import Foundation
import Swinject

/// ContainerResolver
internal class ContainerResolver {
    /// ContainerResolverのシングルトンインスタンス
    internal static let shared = ContainerResolver()
    /// インスタンスが注入済みのコンテナのResolover
    private var containerResolver = ContainerResolver.buildContainerResolver()

    private init() {
    }

    internal static func buildContainerResolver() -> Resolver {
        Assembler([
            HelperAssembly(),
            UseCaseAssembly(),
            RepositoryAssembly()
        ]).resolver
    }

    internal static func buildMockContainerResolver() -> Resolver {
        Assembler([
            MockRepositoryAssembly()
        ]).resolver
    }

    /// 指定したタイプのインスタンスをコンテナから解決(取得)する
    /// - Parameters:
    ///   - type: 解決するインスタンスのタイプ
    /// - Returns: 解決されたインスタンス
    internal func resolve<T>(_ type: T.Type) -> T {
        // swiftlint:disable force_unwrapping
        containerResolver.resolve(T.self)!
    }

    internal func setDependencyMockContainer() {
        self.containerResolver = ContainerResolver.buildMockContainerResolver()
    }
}

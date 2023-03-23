//
//  RepositoryAssembly.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/23.
//

import Foundation
import Swinject

/// Reposiotry関連をContainerに登録するためのクラス
internal final class RepositoryAssembly: Assembly {
    // swiftlint:disable missing_docs
    // swiftlint:disable force_unwrapping
    internal func assemble(container: Swinject.Container) {
        container.register(AppInfoRepository.self) { resolver in
            AppInfoRepositoryImpl(bundle: resolver.resolve(Bundle.self)!)
        }
        .inObjectScope(.container)
        container.register(AuthRepository.self) { _ in
            AuthRepositoryImpl()
        }
        .inObjectScope(.container)
        container.register(DBRepository.self) { _ in
            DBRepositoryImpl()
        }
        .inObjectScope(.container)
    }
}

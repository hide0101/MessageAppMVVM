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
    internal func assemble(container: Swinject.Container) {
        container.register(AppInfoRepository.self) { _ in
            AppInfoRepositoryImpl()
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

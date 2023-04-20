//
//  MockRepositoryAssembly.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/04/20.
//

import Foundation
import Swinject

/// MockReposiotry関連をContainerに登録するためのクラス
internal final class MockRepositoryAssembly: Assembly {
    // swiftlint:disable missing_docs
    internal func assemble(container: Swinject.Container) {
        container.register(AppInfoRepository.self) { _ in
            AppInfoRepositoryMock()
        }
        .inObjectScope(.container)
        container.register(AuthRepository.self) { _ in
            AuthRepositoryMock()
        }
        .inObjectScope(.container)
        container.register(DBRepository.self) { _ in
            DBRepositoryMock()
        }
        .inObjectScope(.container)
    }
}

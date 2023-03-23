//
//  UseCaseAssembly.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/23.
//

import Foundation
import Swinject

/// UseCase関連をContainerに登録するためのクラス
internal final class UseCaseAssembly: Assembly {
    // swiftlint:disable missing_docs
    internal func assemble(container: Swinject.Container) {
        container.register(FetchAppVersion.self) { _ in
            FetchAppVersionImpl()
        }
        .inObjectScope(.container)
    }
}

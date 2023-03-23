//
//  HelperAssembly.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
import Swinject

/// Helper関連をContainerに登録するためのクラス
internal final class HelperAssembly: Assembly {
    // swiftlint:disable missing_docs
    internal func assemble(container: Swinject.Container) {
        container.register(Bundle.self) { _ in
            Bundle.main
        }
        .inObjectScope(.container)
        container.register(Auth.self) { _ in
            Auth.auth()
        }
        .inObjectScope(.container)
        container.register(Firestore.self) { _ in
            Firestore.firestore()
        }
        .inObjectScope(.container)
    }
}

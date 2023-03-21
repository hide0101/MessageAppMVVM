//
//  MessageAppMVVMApp.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/03.
//

import FirebaseAuth
import FirebaseCore
import SwiftUI
import Swinject
import FirebaseFirestore

// swiftlint:disable missing_docs
internal class AppDelegate: NSObject, UIApplicationDelegate {
    // swiftlint:disable discouraged_optional_collection
    internal func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
internal struct MessageAppMVVMApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) internal var delegate

    internal var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension App {
    // swiftlint:disable: force_unwrapping
    internal static func buildContainer() -> Container {
        let container = Container()
        container.register(Bundle.self) { _ in
            Bundle.main
        }
        .inObjectScope(.container)
        container.register(AppInfoRepository.self) { resolver in
            AppInfoRepositoryImpl(bundle: resolver.resolve(Bundle.self)!)
        }
        .inObjectScope(.container)
        container.register(FetchAppVersion.self) { _ in
            FetchAppVersionImpl()
        }
        .inObjectScope(.container)
        container.register(Auth.self) { _ in
            Auth.auth()
        }
        .inObjectScope(.container)
        return container
    }
}

//
//  MessageAppMVVMApp.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/03.
//

import FirebaseCore
import SwiftUI

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

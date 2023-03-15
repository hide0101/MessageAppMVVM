//
//  Inject.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/11.
//

import Foundation
import Swinject

/// フィールドインジェクションするためのプロパティラッパー
@propertyWrapper
internal struct Inject<Service> {
    /// ラップされたプロパティ値
    internal let wrappedValue: Service

    internal init () {
        self.wrappedValue = ContainerResolver.shared.resolve(Service.self)
    }
}

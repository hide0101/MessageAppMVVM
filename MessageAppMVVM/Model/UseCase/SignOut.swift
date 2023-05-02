//
//  SignOut.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/04/30.
//

import Combine
import Foundation

/// サインアウトするUseCase
internal protocol SignOut {
    /// 実行
    func execute() -> AnyPublisher<ResultData<SignOutStatus>, Never>
}

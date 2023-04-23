//
//  SignUpStatus.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/04/09.
//

import Foundation

internal enum SignUpStatus {
    case success
    case networkError
    case emailAlReadyInUse
    case weakPassword
    case invalidEmail
    case unexpectedError
}

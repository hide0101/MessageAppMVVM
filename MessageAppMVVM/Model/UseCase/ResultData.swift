//
//  ResultData.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/04/09.
//

import Foundation

internal struct ResultData<T> {
    internal let status: T
    internal let data: Codable?
    
    internal init(status: T, data: Codable? = nil) {
        self.status = status
        self.data = data
    }
}

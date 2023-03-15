//
//  FetchAppVersionImpl.swift
//  MessageAppMVVM
//
//  Created by hideaki komori on 2023/03/15.
//

import Foundation

// swiftlint:disable missing_docs
internal struct FetchAppVersionImpl: FetchAppVersion {
    @Inject private var appInfoRepository: AppInfoRepository

    internal func invoke() -> String {
        appInfoRepository.appVersion
    }
}

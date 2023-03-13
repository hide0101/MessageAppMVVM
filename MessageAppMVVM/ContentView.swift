//
//  ContentView.swift
//  MessageAppMVVM
//
//  Created by hideaki komori on 2023/03/03.
//

import SwiftUI

/// コンテントビュー
internal struct ContentView: View {
    /// アプリ情報を管理するRepository
    @Inject private var appInfoRepository: AppInfoRepository
    // swiftlint:disable missing_docs
    internal var body: some View {
        VStack {
            Text(appInfoRepository.appVersion)
        }
    }
}

internal struct ContentView_Previews: PreviewProvider {
    internal static var previews: some View {
        ContentView()
    }
}

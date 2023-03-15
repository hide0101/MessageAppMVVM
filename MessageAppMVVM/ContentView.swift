//
//  ContentView.swift
//  MessageAppMVVM
//
//  Created by hideaki komori on 2023/03/03.
//

import SwiftUI

/// コンテントビュー
internal struct ContentView: View {
    /// アプリ情報を取得するUseCase
    @Inject private var fetchAppVersion: FetchAppVersion
    // swiftlint:disable missing_docs
    internal var body: some View {
        VStack {
            Text(fetchAppVersion.invoke())
        }
    }
}

internal struct ContentView_Previews: PreviewProvider {
    internal static var previews: some View {
        ContentView()
    }
}

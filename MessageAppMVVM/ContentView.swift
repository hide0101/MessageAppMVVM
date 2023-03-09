//
//  ContentView.swift
//  MessageAppMVVM
//
//  Created by hideaki komori on 2023/03/03.
//

import SwiftUI

/// コンテントビュー
internal struct ContentView: View {
    // swiftlint:disable missing_docs
    internal var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

internal struct ContentView_Previews: PreviewProvider {
    internal static var previews: some View {
        ContentView()
    }
}

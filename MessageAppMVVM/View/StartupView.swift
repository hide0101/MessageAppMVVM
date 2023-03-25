//
//  StartupView.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/25.
//

import SwiftUI

/// スタートアップ画面
internal struct StartupView: View {
    /// サインアップ画面の表示状態
    @State private var signUpIsPresented = false
    /// body
    internal var body: some View {
        NavigationStack {
            VStack {
                // TODO 文字列リソース化
                Button("サインアップ") {
                    signUpIsPresented = true
                }
                .navigationDestination(isPresented: $signUpIsPresented) {
                    SignUpView()
                }
            }
        }
    }
}

/// スタートアップ画面のPreviews
internal struct StartupView_Previews: PreviewProvider {
    /// previews
    internal static var previews: some View {
        StartupView()
    }
}

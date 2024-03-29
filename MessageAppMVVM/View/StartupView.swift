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
    /// サインイン画面の表示状態
    @State private var signInIsPresented = false

    /// body
    internal var body: some View {
        NavigationStack {
            VStack {
                Button(L10n.Startup.SignUp.title) {
                    signUpIsPresented = true
                }
                .navigationDestination(isPresented: $signUpIsPresented) {
                    SignUpView()
                }
                Button(L10n.Startup.SignIn.title) {
                    signInIsPresented = true
                }
                .navigationDestination(isPresented: $signInIsPresented) {
                    SignInView()
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

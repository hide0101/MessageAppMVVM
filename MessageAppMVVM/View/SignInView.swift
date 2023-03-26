//
//  SignInView.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/26.
//

import SwiftUI

/// サインイン画面
internal struct SignInView: View {
    /// メールアドレス
    @State private var email = ""
    /// パスワード
    @State private var password = ""
    /// body
    internal var body: some View {
        VStack {
            Text(L10n.SignIn.Email.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("hoge@gmail.com", text: $email)
            Text("ここでエラーを表示する")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(L10n.SignIn.Password.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("入力してください", text: $email)
            Text("ここでエラーを表示する")
                .frame(maxWidth: .infinity, alignment: .leading)
            Button(L10n.SignIn.Submit.title) {
                // TODO 登録メソッドを実行する
                print("サインインメソッドを実行する")
            }
        }
    }
}

/// サインイン画面のPreviews
internal struct SignInView_Previews: PreviewProvider {
    /// previews
    internal static var previews: some View {
        SignInView()
    }
}

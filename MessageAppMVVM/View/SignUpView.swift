//
//  SignUpView.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/25.
//

import SwiftUI

/// サインアップ画面
internal struct SignUpView: View {
    /// メールアドレス
    @State private var email = ""
    /// パスワード
    @State private var password = ""
    /// ユーザー名
    @State private var userName = ""
    /// body
    internal var body: some View {
        VStack {
            Text(L10n.SignUp.Email.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("hoge@gmail.com", text: $email)
            Text("ここでエラーを表示する")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(L10n.SignUp.Password.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("入力してください", text: $email)
            Text("ここでエラーを表示する")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(L10n.SignUp.UserName.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("入力してください", text: $email)
            Text("ここでエラーを表示する")
                .frame(maxWidth: .infinity, alignment: .leading)
            Button(L10n.SignUp.Submit.title) {
                // TODO 登録メソッドを実行する
                print("登録メソッドを実行する")
            }
        }
    }
}

/// サインアップ画面のPreviews
internal struct SignUpView_Previews: PreviewProvider {
    internal static var previews: some View {
        SignUpView()
    }
}

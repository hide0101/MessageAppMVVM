//
//  StartupView.swift
//  MessageAppMVVM
//
//  Created by hide0101 on 2023/03/25.
//

import SwiftUI

internal struct StartupView: View {
    internal var body: some View {
        VStack {
            Button("サインアップ") {
                print("サインアップ")
            }
            Button("サインイン") {
                print("サインイン")
            }
        }
    }
}

internal struct StartupView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView()
    }
}

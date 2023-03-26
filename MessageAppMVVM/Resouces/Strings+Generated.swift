// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum SignIn {
    internal enum Email {
      /// メールアドレス
      internal static let title = L10n.tr("MessageAppMVVM", "sign_in.email.title", fallback: "メールアドレス")
    }
    internal enum Password {
      /// パスワード
      internal static let title = L10n.tr("MessageAppMVVM", "sign_in.password.title", fallback: "パスワード")
    }
    internal enum Submit {
      /// サインイン
      internal static let title = L10n.tr("MessageAppMVVM", "sign_in.submit.title", fallback: "サインイン")
    }
  }
  internal enum SignUp {
    internal enum Email {
      /// メールアドレス
      internal static let title = L10n.tr("MessageAppMVVM", "sign_up.email.title", fallback: "メールアドレス")
    }
    internal enum Password {
      /// パスワード
      internal static let title = L10n.tr("MessageAppMVVM", "sign_up.password.title", fallback: "パスワード")
    }
    internal enum Submit {
      /// サインアップ
      internal static let title = L10n.tr("MessageAppMVVM", "sign_up.submit.title", fallback: "サインアップ")
    }
    internal enum UserName {
      /// ユーザー名
      internal static let title = L10n.tr("MessageAppMVVM", "sign_up.user_name.title", fallback: "ユーザー名")
    }
  }
  internal enum Startup {
    internal enum SignIn {
      /// サインイン
      internal static let title = L10n.tr("MessageAppMVVM", "startup.sign_in.title", fallback: "サインイン")
    }
    internal enum SignUp {
      /// MessageAppMVVM.strings
      ///   MessageAppMVVM
      /// 
      ///   Created by hide0101 on 2023/03/04.
      internal static let title = L10n.tr("MessageAppMVVM", "startup.sign_up.title", fallback: "サインアップ")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type

// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum LogableUser {
    internal enum Guest {
      /// Guest
      internal static let title = L10n.tr("Localizable", "LogableUser.Guest.title")
    }
    internal enum New {
      /// New User
      internal static let title = L10n.tr("Localizable", "LogableUser.New.title")
    }
  }

  internal enum LoginView {
    internal enum Login {
      /// Login
      internal static let title = L10n.tr("Localizable", "LoginView.Login.title")
    }
    internal enum Password {
      /// Type your password
      internal static let placeholder = L10n.tr("Localizable", "LoginView.Password.placeholder")
      /// Password
      internal static let title = L10n.tr("Localizable", "LoginView.Password.title")
    }
    internal enum Switch {
      /// Save session with biometry
      internal static let title = L10n.tr("Localizable", "LoginView.Switch.title")
    }
    internal enum Username {
      /// Type your username
      internal static let placeholder = L10n.tr("Localizable", "LoginView.Username.placeholder")
      /// Username
      internal static let title = L10n.tr("Localizable", "LoginView.Username.title")
    }
  }

  internal enum UsersViewController {
    /// Who's searching?
    internal static let title = L10n.tr("Localizable", "UsersViewController.title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle = Bundle(for: BundleToken.self)
}
// swiftlint:enable convenience_type

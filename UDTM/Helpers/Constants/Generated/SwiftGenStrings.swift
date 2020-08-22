// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum Headers {
    public enum Keys {
      /// accept
      public static let accept = L10n.tr("Localizable", "Headers.Keys.Accept")
      /// Authorization
      public static let authorization = L10n.tr("Localizable", "Headers.Keys.Authorization")
      /// Content-Type
      public static let contentType = L10n.tr("Localizable", "Headers.Keys.ContentType")
    }
    public enum Values {
      /// Bearer %@
      public static func bearer(_ p1: Any) -> String {
        return L10n.tr("Localizable", "Headers.Values.Bearer", String(describing: p1))
      }
      /// application/json
      public static let jsonApplication = L10n.tr("Localizable", "Headers.Values.JsonApplication")
      /// application/json;charset=utf-8
      public static let jsonContentType = L10n.tr("Localizable", "Headers.Values.JsonContentType")
    }
  }

  public enum SpecificHeaders {
    public enum Keys {
      /// tmdb
      public static let tmdb = L10n.tr("Localizable", "SpecificHeaders.Keys.tmdb")
    }
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

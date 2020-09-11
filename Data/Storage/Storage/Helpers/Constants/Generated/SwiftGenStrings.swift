// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum Address {
    public enum File {
      /// json
      public static let `extension` = L10n.tr("Localizable", "Address.File.extension")
    }
  }

  public enum Error {
    public enum Descriction {
      /// Não foi possível recuperar o saldo da conta.
      public static let balance = L10n.tr("Localizable", "Error.Descriction.balance")
      /// Não foi possível recuperar os dados via biometria.
      public static let biometric = L10n.tr("Localizable", "Error.Descriction.biometric")
      /// Não foi possível recuperar seu CPF.
      public static let cpf = L10n.tr("Localizable", "Error.Descriction.cpf")
      public enum Localized {
        /// Não foi possível recuperar as mensagens.
        public static let retrieving = L10n.tr("Localizable", "Error.Descriction.Localized.retrieving")
        /// Não foi possível salvar as mensagens.
        public static let saving = L10n.tr("Localizable", "Error.Descriction.Localized.saving")
      }
      public enum Token {
        /// Não foi possível salvar o token.
        public static let retrieving = L10n.tr("Localizable", "Error.Descriction.Token.retrieving")
        /// Não foi possível recuperar o token.
        public static let saving = L10n.tr("Localizable", "Error.Descriction.Token.saving")
      }
    }
  }

  public enum File {
    public enum Extension {
      /// json
      public static let json = L10n.tr("Localizable", "File.Extension.json")
    }
  }

  public enum LaunchStorage {
    public enum ValueKey {
      /// hasLaunched
      public static let hasLaunched = L10n.tr("Localizable", "LaunchStorage.ValueKey.hasLaunched")
    }
  }

  public enum Realm {
    public enum Database {
      /// default
      public static let defaultName = L10n.tr("Localizable", "Realm.Database.defaultName")
      /// realm_database_%@
      public static func name(_ p1: Any) -> String {
        return L10n.tr("Localizable", "Realm.Database.name", String(describing: p1))
      }
      /// %@.realm
      public static func path(_ p1: Any) -> String {
        return L10n.tr("Localizable", "Realm.Database.path", String(describing: p1))
      }
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

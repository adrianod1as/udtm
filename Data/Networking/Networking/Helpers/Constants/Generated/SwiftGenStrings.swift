// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum Error {
    public enum Code {
      /// E007
      public static let duplicate = L10n.tr("Localizable", "Error.Code.duplicate")
    }
    public enum Descriction {
      /// Não foi possivel obter o saldo
      public static let balance = L10n.tr("Localizable", "Error.Descriction.balance")
      /// Não foi possível recuperar os dados.
      public static let data = L10n.tr("Localizable", "Error.Descriction.data")
      /// Não foi possível efetuar a requisição.
      public static let request = L10n.tr("Localizable", "Error.Descriction.request")
    }
    public enum Description {
      /// Tivemos um problema de conexão, tente novamente mais tarde.
      public static let connectionProblem = L10n.tr("Localizable", "Error.Description.connectionProblem")
      /// Sessão Expirada.
      public static let expiredSession = L10n.tr("Localizable", "Error.Description.expiredSession")
      /// Sem conexão com a Internet.
      public static let noInternetConnection = L10n.tr("Localizable", "Error.Description.noInternetConnection")
      /// Ocorreu um erro no certificado. Por favor, tente novamente mais tarde.
      public static let pinnedCertificate = L10n.tr("Localizable", "Error.Description.pinnedCertificate")
    }
    public enum Field {
      /// code
      public static let code = L10n.tr("Localizable", "Error.Field.code")
      /// errors
      public static let collection = L10n.tr("Localizable", "Error.Field.collection")
      /// fault
      public static let fault = L10n.tr("Localizable", "Error.Field.fault")
      /// message
      public static let message = L10n.tr("Localizable", "Error.Field.message")
      /// message
      public static let object = L10n.tr("Localizable", "Error.Field.object")
      /// error
      public static let single = L10n.tr("Localizable", "Error.Field.single")
    }
  }

  public enum Header {
    public enum Field {
      /// Authorization
      public static let authorization = L10n.tr("Localizable", "Header.Field.authorization")
      /// X-Authorization
      public static let xauthorization = L10n.tr("Localizable", "Header.Field.xauthorization")
    }
    public enum Value {
      /// Bearer
      public static let bearer = L10n.tr("Localizable", "Header.Value.bearer")
    }
  }

  public enum Response {
    public enum Field {
      /// balance
      public static let balance = L10n.tr("Localizable", "Response.Field.balance")
      /// data
      public static let data = L10n.tr("Localizable", "Response.Field.data")
      /// token
      public static let token = L10n.tr("Localizable", "Response.Field.token")
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

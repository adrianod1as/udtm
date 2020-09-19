// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Error {
    internal enum Code {
      /// E007
      internal static let duplicate = L10n.tr("Localizable", "Error.Code.duplicate")
    }
    internal enum Description {
      /// Não foi possivel obter o saldo
      internal static let balance = L10n.tr("Localizable", "Error.Description.balance")
      /// Tivemos um problema de conexão, tente novamente mais tarde.
      internal static let connectionProblem = L10n.tr("Localizable", "Error.Description.connectionProblem")
      /// Não foi possível recuperar os dados.
      internal static let data = L10n.tr("Localizable", "Error.Description.data")
      /// Sessão Expirada.
      internal static let expiredSession = L10n.tr("Localizable", "Error.Description.expiredSession")
      /// Sem conexão com a Internet.
      internal static let noInternetConnection = L10n.tr("Localizable", "Error.Description.noInternetConnection")
      /// Ocorreu um erro no certificado. Por favor, tente novamente mais tarde.
      internal static let pinnedCertificate = L10n.tr("Localizable", "Error.Description.pinnedCertificate")
      /// Não foi possível efetuar a requisição.
      internal static let request = L10n.tr("Localizable", "Error.Description.request")
      internal enum Token {
        /// Token não autenticado pelo usuário.
        internal static let authentication = L10n.tr("Localizable", "Error.Description.Token.authentication")
        /// Não foi possível obter url de autenticação para o Token.
        internal static let url = L10n.tr("Localizable", "Error.Description.Token.url")
      }
    }
    internal enum Field {
      /// code
      internal static let code = L10n.tr("Localizable", "Error.Field.code")
      /// errors
      internal static let collection = L10n.tr("Localizable", "Error.Field.collection")
      /// fault
      internal static let fault = L10n.tr("Localizable", "Error.Field.fault")
      /// message
      internal static let message = L10n.tr("Localizable", "Error.Field.message")
      /// message
      internal static let object = L10n.tr("Localizable", "Error.Field.object")
      /// error
      internal static let single = L10n.tr("Localizable", "Error.Field.single")
    }
  }

  internal enum Header {
    internal enum Field {
      /// Authorization
      internal static let authorization = L10n.tr("Localizable", "Header.Field.authorization")
      /// X-Authorization
      internal static let xauthorization = L10n.tr("Localizable", "Header.Field.xauthorization")
    }
    internal enum Value {
      /// Bearer
      internal static let bearer = L10n.tr("Localizable", "Header.Value.bearer")
    }
  }

  internal enum RequestToken {
    internal enum Permission {
      /// https://www.themoviedb.org/authenticate/%@
      internal static func url(_ p1: Any) -> String {
        return L10n.tr("Localizable", "RequestToken.Permission.url", String(describing: p1))
      }
    }
  }

  internal enum Response {
    internal enum Field {
      /// balance
      internal static let balance = L10n.tr("Localizable", "Response.Field.balance")
      /// data
      internal static let data = L10n.tr("Localizable", "Response.Field.data")
      /// token
      internal static let token = L10n.tr("Localizable", "Response.Field.token")
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

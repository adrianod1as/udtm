// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum L10n {

  public enum Deposit {
    public enum Bill {
      /// boleto_%@_dmcard.pdf
      public static func fileName(_ p1: Any) -> String {
        return L10n.tr("Localizable", "Deposit.Bill.fileName", String(describing: p1))
      }
    }
    public enum Error {
      /// Não foi possível obter o pdf.
      public static let file = L10n.tr("Localizable", "Deposit.Error.file")
    }
  }

  public enum Error {
    public enum Descriction {
      public enum Cities {
        /// Não foi possível recuperar os dados das cidades.
        public static let retrieving = L10n.tr("Localizable", "Error.Descriction.Cities.retrieving")
      }
      public enum Proposal {
        /// Não foi possível excluir a proposta.
        public static let deleting = L10n.tr("Localizable", "Error.Descriction.Proposal.deleting")
        /// Não foi possível recuperar os dados da proposta.
        public static let retrieving = L10n.tr("Localizable", "Error.Descriction.Proposal.retrieving")
        /// Não foi possível salvar a proposta.
        public static let saving = L10n.tr("Localizable", "Error.Descriction.Proposal.saving")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type

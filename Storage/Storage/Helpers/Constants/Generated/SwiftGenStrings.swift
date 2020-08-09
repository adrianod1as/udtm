// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum L10n {

  public enum Address {
    public enum File {
      /// json
      public static let `extension` = L10n.tr("Localizable", "Address.File.extension")
      /// cities_states
      public static let name = L10n.tr("Localizable", "Address.File.name")
    }
  }

  public enum AuthCredentialsStorage {
    public enum ValueKey {
      /// opened_proposal
      public static let openedProposal = L10n.tr("Localizable", "AuthCredentialsStorage.ValueKey.openedProposal")
      /// selected_user_id
      public static let selectedUserId = L10n.tr("Localizable", "AuthCredentialsStorage.ValueKey.selectedUserId")
      /// wso2_token
      public static let wso2Token = L10n.tr("Localizable", "AuthCredentialsStorage.ValueKey.wso2Token")
    }
  }

  public enum Error {
    public enum Descriction {
      /// Falha ao carregar endereço
      public static let address = L10n.tr("Localizable", "Error.Descriction.address")
      /// Não foi possível recuperar o saldo da conta.
      public static let balance = L10n.tr("Localizable", "Error.Descriction.balance")
      /// Não foi possível recuperar o saldo da conta.
      public static let biometric = L10n.tr("Localizable", "Error.Descriction.biometric")
      /// Não foi possível recuperar seu CPF.
      public static let cpf = L10n.tr("Localizable", "Error.Descriction.cpf")
      public enum Account {
        /// Não foi possível recuperar os dados da conta.
        public static let retrieving = L10n.tr("Localizable", "Error.Descriction.Account.retrieving")
        /// Não foi possível salvar a conta.
        public static let saving = L10n.tr("Localizable", "Error.Descriction.Account.saving")
      }
      public enum Credentials {
        /// Não foi possível recuperar as credenciais.
        public static let retrieving = L10n.tr("Localizable", "Error.Descriction.Credentials.retrieving")
        /// Não foi possível salvar as credênciais.
        public static let saving = L10n.tr("Localizable", "Error.Descriction.Credentials.saving")
      }
      public enum Localized {
        /// Não foi possível recuperar as mensagens.
        public static let retrieving = L10n.tr("Localizable", "Error.Descriction.Localized.retrieving")
        /// Não foi possível salvar as mensagens.
        public static let saving = L10n.tr("Localizable", "Error.Descriction.Localized.saving")
      }
      public enum Proposal {
        /// Não foi possível excluir a proposta.
        public static let deleting = L10n.tr("Localizable", "Error.Descriction.Proposal.deleting")
        /// Não foi possível recuperar os dados da proposta.
        public static let retrieving = L10n.tr("Localizable", "Error.Descriction.Proposal.retrieving")
        /// Não foi possível salvar a proposta.
        public static let saving = L10n.tr("Localizable", "Error.Descriction.Proposal.saving")
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

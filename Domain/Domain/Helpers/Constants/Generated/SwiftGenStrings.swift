// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum L10n {

  public enum Deposit {
    public enum Value {
      /// R$10.000,00
      public static let maximum = L10n.tr("Localizable", "Deposit.Value.maximum")
      /// R$20,00
      public static let minimum = L10n.tr("Localizable", "Deposit.Value.minimum")
    }
  }

  public enum Error {
    public enum Code {
      /// E140
      public static let disablingBlock = L10n.tr("Localizable", "Error.Code.disablingBlock")
      /// E007
      public static let duplicatedAccount = L10n.tr("Localizable", "Error.Code.duplicatedAccount")
      /// E135
      public static let scammer = L10n.tr("Localizable", "Error.Code.scammer")
      /// E122
      public static let unavailableProposal = L10n.tr("Localizable", "Error.Code.unavailableProposal")
    }
    public enum Description {
      /// Tivemos um problema de conexão, tente novamente mais tarde.
      public static let connectionProblem = L10n.tr("Localizable", "Error.Description.connectionProblem")
      /// Sessão Expirada.
      public static let expiredSession = L10n.tr("Localizable", "Error.Description.expiredSession")
      /// Sem conexão com a Internet.
      public static let noInternetConnection = L10n.tr("Localizable", "Error.Description.noInternetConnection")
      /// Houve um erro inesperado.
      public static let unexpected = L10n.tr("Localizable", "Error.Description.unexpected")
    }
    public enum Message {
      /// O valor deve ser entre %@ e %@
      public static func between(_ p1: Any, _ p2: Any) -> String {
        return L10n.tr("Localizable", "Error.Message.between", String(describing: p1), String(describing: p2))
      }
      /// Número inválido.
      public static let cardNumber = L10n.tr("Localizable", "Error.Message.cardNumber")
      /// Número de celular inválido.
      public static let cellphone = L10n.tr("Localizable", "Error.Message.cellphone")
      /// Código inválido.
      public static let code = L10n.tr("Localizable", "Error.Message.code")
      /// CPF inválido.
      public static let cpf = L10n.tr("Localizable", "Error.Message.cpf")
      /// Data inválida.
      public static let date = L10n.tr("Localizable", "Error.Message.date")
      /// Os campos diferem.
      public static let different = L10n.tr("Localizable", "Error.Message.different")
      /// E-mail inválido.
      public static let email = L10n.tr("Localizable", "Error.Message.email")
      /// O valor deve ser maior que %@.
      public static func greater(_ p1: Any) -> String {
        return L10n.tr("Localizable", "Error.Message.greater", String(describing: p1))
      }
      /// Campos obrigatórios.
      public static let multiRequiment = L10n.tr("Localizable", "Error.Message.multiRequiment")
      /// O nome deve ser composto, conter apenas letras e ter ao menos %d caractéres.
      public static func name(_ p1: Int) -> String {
        return L10n.tr("Localizable", "Error.Message.name", p1)
      }
      /// Campo obrigatório.
      public static let requiment = L10n.tr("Localizable", "Error.Message.requiment")
      /// RG inválido.
      public static let rg = L10n.tr("Localizable", "Error.Message.rg")
      /// A data deve ser a partir do dia atual.
      public static let today = L10n.tr("Localizable", "Error.Message.today")
      /// CEP inválido.
      public static let zip = L10n.tr("Localizable", "Error.Message.zip")
      public enum Account {
        /// Conta inválida.
        public static let invalid = L10n.tr("Localizable", "Error.Message.Account.invalid")
      }
      public enum Address {
        /// Não foi possível encontrar o endereço para o cep informado.
        public static let search = L10n.tr("Localizable", "Error.Message.Address.search")
        /// Não foi possível validar o endereço
        public static let validation = L10n.tr("Localizable", "Error.Message.Address.validation")
      }
      public enum Age {
        /// Você precisa ter menos de %d anos.
        public static func maximum(_ p1: Int) -> String {
          return L10n.tr("Localizable", "Error.Message.Age.maximum", p1)
        }
        /// Você precisa ter mais de %d anos.
        public static func minimum(_ p1: Int) -> String {
          return L10n.tr("Localizable", "Error.Message.Age.minimum", p1)
        }
      }
      public enum Agency {
        /// Agência inválida.
        public static let invalid = L10n.tr("Localizable", "Error.Message.Agency.invalid")
      }
      public enum Bank {
        /// Código inválido.
        public static let invalidCode = L10n.tr("Localizable", "Error.Message.Bank.invalidCode")
      }
      public enum Password {
        /// Senha inválida.
        public static let invalid = L10n.tr("Localizable", "Error.Message.Password.invalid")
      }
      public enum Transfer {
        /// Com a taxa de %@ do TED, o valor máximo disponível transferência é de %@.
        public static func fee(_ p1: Any, _ p2: Any) -> String {
          return L10n.tr("Localizable", "Error.Message.Transfer.fee", String(describing: p1), String(describing: p2))
        }
        /// Saldo insuficiente.
        public static let noMoney = L10n.tr("Localizable", "Error.Message.Transfer.noMoney")
      }
      public enum Value {
        /// O valor deve ser no máximo %@.
        public static func maximum(_ p1: Any) -> String {
          return L10n.tr("Localizable", "Error.Message.Value.maximum", String(describing: p1))
        }
        /// O valor deve ser no mínimo %@.
        public static func minimum(_ p1: Any) -> String {
          return L10n.tr("Localizable", "Error.Message.Value.minimum", String(describing: p1))
        }
        /// Saldo insuficiente.
        public static let noMoney = L10n.tr("Localizable", "Error.Message.Value.noMoney")
      }
    }
    public enum Title {
      /// Ops!
      public static let ops = L10n.tr("Localizable", "Error.Title.ops")
    }
  }

  public enum RegularExpression {
    public enum Error {
      /// Illegal regular expression:
      public static let illegal = L10n.tr("Localizable", "RegularExpression.Error.illegal")
    }
  }

  public enum Symbol {
    /// a.m
    public static let am = L10n.tr("Localizable", "Symbol.am")
    /// \b
    public static let backspace = L10n.tr("Localizable", "Symbol.backspace")
    /// R$
    public static let currency = L10n.tr("Localizable", "Symbol.Currency")
    /// 
    public static let empty = L10n.tr("Localizable", "Symbol.empty")
    /// pt_BR
    public static let locale = L10n.tr("Localizable", "Symbol.locale")
    ///  
    public static let nonBreakingSpace = L10n.tr("Localizable", "Symbol.nonBreakingSpace")
    /// %%
    public static let percentage = L10n.tr("Localizable", "Symbol.percentage")
    ///  
    public static let whitespace = L10n.tr("Localizable", "Symbol.whitespace")
    /// 0
    public static let zero = L10n.tr("Localizable", "Symbol.zero")
    /// R$0,00
    public static let zeroCurrency = L10n.tr("Localizable", "Symbol.zeroCurrency")
  }

  public enum Withdraw {
    public enum Value {
      /// R$1.500,00
      public static let maximum = L10n.tr("Localizable", "Withdraw.Value.maximum")
      /// R$10,00
      public static let minimum = L10n.tr("Localizable", "Withdraw.Value.minimum")
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

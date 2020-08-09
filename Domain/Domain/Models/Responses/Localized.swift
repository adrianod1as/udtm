//
//  Localized.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public struct Localized: Codable {

    public let code: String
    public let message: String

    public init(code: String, message: String) {
        self.code = code.withoutSpecialCharacters
        self.message = message
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let code = try container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.code = code.withoutSpecialCharacters
        self.message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
    }
}

extension Localized: AppFailure {

    public var failureReason: String? {
        return code
    }

    public var errorDescription: String? {
        if isScammer {
            return Localized.unexpected.errorDescription
        } else if isDisablingBlock {
            return message
        }
        return description
    }
}

public extension Localized {

    static var unexpected: Localized {
        return Localized(code: "E000", message: L10n.Error.Description.unexpected)
    }

    var isDuplicatedAccount: Bool {
        return code == L10n.Error.Code.duplicatedAccount
    }

    var isProposalUnavailable: Bool {
        return code == L10n.Error.Code.unavailableProposal
    }

    var isScammer: Bool {
        return code == L10n.Error.Code.scammer
    }

    var isDisablingBlock: Bool {
      return code == L10n.Error.Code.disablingBlock
    }

    func replacingMessage(with dictionary: [String: Any]) -> Localized {
        guard !dictionary.isEmpty else {
            return self
        }
        var message = self.message
        dictionary.forEach { (key, value) in
            message = message.replacingOccurrences(of: "{\(key)}", with: "\(value)")
        }
        return Localized(code: code, message: message)
    }
}

extension Localized: Equatable, CustomStringConvertible {

    static public func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.code.uppercased() == rhs.code.uppercased()
    }

    public var description: String {
        return "\(message) (\(code))"
    }
}

public extension Array where Element == Localized {

    var isDuplicatedAccount: Bool {
        return filter({ $0.shouldStopAppFlow && $0.isDuplicatedAccount }).first != nil
    }

    var isProposalUnavailable: Bool {
        return filter({ $0.shouldStopAppFlow && $0.isProposalUnavailable }).first != nil
    }

    var isScammer: Bool {
        return filter({ $0.shouldStopAppFlow && $0.isScammer }).first != nil
    }

    var isDisablingBlock: Bool {
        return filter({ $0.shouldStopAppFlow && $0.isDisablingBlock }).first != nil
    }

    var safeForUse: [Element] {
        return self.filter({ !$0.code.isEmpty && !$0.message.isEmpty })
    }

    func localized(from code: String) -> Localized? {
        return self.filter({ $0.code.uppercased() == code.uppercased() }).first
    }

    func localized(from rawLocalized: Localized) -> Localized? {
        return self.filter({ $0 == rawLocalized }).first
    }

    func safeLocalized(from code: String, message: String) -> Localized {
        guard let localized = self.localized(from: code) else {
            return Localized(code: code, message: message)
        }
        return localized
    }

    func safeLocalized(from rawLocalized: Localized) -> Localized {
        guard let localized = self.localized(from: rawLocalized) else {
            return rawLocalized
        }
        return localized
    }

    func safeLocalized(from rawLocalizeds: [Localized]) -> [Localized] {
        return rawLocalizeds.map({ self.safeLocalized(from: $0) })
    }

    func replacingMessage(with dictionary: [String: Any]) -> [Element] {
        return map({ $0.replacingMessage(with: dictionary) })
    }
}

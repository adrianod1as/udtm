//
//  Credentials.swift
//  Domain
//
//  Created by Adriano Dias on 02/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

/*
{
    "username": "johnny_appleseed",
    "password": "test123",
    "request_token": "1531f1a558c8357ce8990cf887ff196e8f5402ec"
}
*/

public struct Credentials: Codable {

    public let username: String
    public let password: String
    public var requestToken: String

    enum CodingKeys: String, CodingKey {
        case requestToken = "request_token"
        case username, password
    }

    public init(username: String, password: String, requestToken: String) {
        self.username = username
        self.password = password
        self.requestToken = requestToken
    }

    public mutating func set(requestToken: String) {
        self.requestToken = requestToken
    }

    public func setting(requestToken: String) -> Credentials {
        var credentials = self
        credentials.set(requestToken: requestToken)
        return credentials
    }
}

extension Credentials: Validatable {

    public enum Failure: LocalizedError {
        case user(String)
        case password(String)

        public var failureReason: String? {
            return L10n.Error.Title.ops
        }

        public var errorDescription: String? {
            switch self {
            case .user(let message), .password(let message):
                return message
            }
        }
    }

    var validations: [ValidationResult] {
        return [usernameValidation, passwordValidation]
    }

    var usernameValidation: ValidationResult {
        return Enforcer(value: username,
                        validations: [.nonEmpty(error: Failure.user(L10n.Error.Message.requiment))])
                        .enforce()
    }

    var passwordValidation: ValidationResult {
        return Enforcer(value: password,
                        validations: [.nonEmpty(error: Failure.password(L10n.Error.Message.requiment))])
                        .enforce()
    }
}

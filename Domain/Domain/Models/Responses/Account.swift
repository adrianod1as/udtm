//
//  Account .swift
//  Domain
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

/*
{
    "avatar": {
        "gravatar": {
            "hash": "c9e9fc152ee756a900db85757c29815d"
        }
    },
    "id": 548,
    "iso_639_1": "en",
    "iso_3166_1": "CA",
    "name": "Travis Bell",
    "include_adult": true,
    "username": "travisbell"
}
*/
public struct Account: Codable {

    public let id: String
    public let name: String
    public let username: String
    public let avatar: Gravatar

    public init(id: String, name: String, username: String, avatar: Gravatar) {
        self.id = id
        self.name = name
        self.username = username
        self.avatar = avatar
    }
}

extension Account: Validatable {

    public enum Failure: LocalizedError {
        case id(String)

        public var failureReason: String? {
            return L10n.Error.Title.ops
        }

        public var errorDescription: String? {
            switch self {
            case .id(let message):
                return message
            }
        }
    }

    var validations: [ValidationResult] {
        return [idValidation]
    }

    var idValidation: ValidationResult {
        return Enforcer(value: username,
                        validations: [.nonEmpty(error: Failure.id(L10n.Error.Message.requiment))])
            .enforce()
    }
}

extension Account: Equatable {

    public static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.id == rhs.id && lhs.username == rhs.username
    }
}

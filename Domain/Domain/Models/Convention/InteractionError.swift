//
//  InteractionError
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public enum InteractionError: Error {
    case invalidInput(String)
    case failedRequest(String)
    case appFailure([Localized])
    case connectionProblem(String)
    case noInternetConnection(String)
    case expiredUserSession(String)
    case resourceNotFound(String)
    case none
}

extension InteractionError: LocalizedError {

    public var failureReason: String? {
        switch self {
        case .appFailure(let errors):
            return errors.failureReason
        default:
            return L10n.Error.Title.ops
        }
    }

    public var errorDescription: String? {
        switch self {
        case .invalidInput(let message):
            return message
        case .failedRequest(let message):
            return message
        case .connectionProblem(let message):
            return message
        case .resourceNotFound(let message):
            return message
        case .noInternetConnection(let message):
            return message
        case .expiredUserSession(let message):
            return message
        case .appFailure(let errors):
            return errors.errorDescription
        default:
            return L10n.Symbol.empty
        }
    }
}

public extension InteractionError {

    var localizeds: [Localized] {
        switch self {
        case .appFailure(let localizeds):
            return localizeds
        default:
            return [Localized]()
        }
    }
}

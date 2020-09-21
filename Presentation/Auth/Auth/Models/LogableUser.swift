//
//  LogableUsers.swift
//  Auth
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit
import Domain

public enum LogableUser {
    case registered(Account)
    case new
    case guest

    static let standardUsers: [LogableUser] = [.new, .guest]

    var title: String {
        switch self {
        case .registered(let account):
            return account.username
        case .new:
            return "New User"
        case .guest:
            return "Guest"
        }
    }
}

extension LogableUser: Equatable {

    public static func == (lhs: LogableUser, rhs: LogableUser) -> Bool {
        switch (lhs, rhs) {
        case (.new, .new):
            return true
        case (.guest, .guest):
            return true
        case (.registered(let lhsAccount), .registered(let rhsAccount)):
            return lhsAccount == rhsAccount
        default:
            return false
        }
    }
}

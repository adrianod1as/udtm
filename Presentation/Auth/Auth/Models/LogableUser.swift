//
//  LogableUsers.swift
//  Auth
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit
import Common
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

    var avatarURL: URL? {
        switch self {
        case .registered(let account):
            return account.avatar.asUrl
        default:
            return nil
        }
    }

    var avatarIcon: UIImage? {
        switch self {
        case .guest:
            return Asset.incognito.image
        case .new:
            return Asset.newUser.image
        default:
            return nil
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .new:
            return ColorName.golden
        case .guest:
            return ColorName.paynesGrey
        default:
            return .clear
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

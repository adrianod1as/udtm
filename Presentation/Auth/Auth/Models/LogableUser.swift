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
            return account.name
        case .new:
            return "New User"
        case .guest:
            return "Guest"
        }
    }
}

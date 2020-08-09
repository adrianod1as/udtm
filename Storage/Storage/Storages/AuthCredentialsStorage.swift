//
//  AuthCredentialsStorage.swift
//  Storage
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import KeychainAccess
import Domain

public class AuthCredentialsStorage: KeychainStoring {

    public var service: String?

    public var accessGroup: String?

    public init(service: String? = nil, accessGroup: String? = nil) {
        self.service = service
        self.accessGroup = accessGroup
    }

    public enum ValueKeyable: String, Keyable, CaseIterable {
        case selectedUserId
        case user
        case firebaseToken

        public var key: String {
            return rawValue
        }

        public var isAuthenticationInfo: Bool {
            switch self {
            case .user, .firebaseToken:
                return false
            default:
                return true
            }
        }

        static public var authenticationInfoKeys: [ValueKeyable] {
            return allCases.filter({ $0.isAuthenticationInfo })
        }

        static public var nonAuthenticationInfoKeys: [ValueKeyable] {
            return allCases.filter({ !$0.isAuthenticationInfo })
        }
    }

}

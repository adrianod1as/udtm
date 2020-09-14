//
//  AccountTarget.swift
//  Networking
//
//  Created by Adriano Dias on 09/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import OxeNetworking
import Moya
import Domain

public enum AccountTarget {
    case accountDetails(sessionId: String)
}

extension AccountTarget: TMDBApiFriendly {

    public var api: String {
        return "account"
    }

    public var version: String {
        return 3.description
    }

    public var path: String {
        switch self {
        case .accountDetails:
            return "\(version)/\(api)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .accountDetails:
            return .get
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .accountDetails(let id):
            return .requestParameters(parameters: ["session_id": id], encoding: JSONEncoding.default)
        }
    }
}

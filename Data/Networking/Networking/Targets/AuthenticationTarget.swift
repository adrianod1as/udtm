//
//  AuthenticationTarget.swift
//  Networking
//
//  Created by Adriano Dias on 09/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import OxeNetworking
import Moya
import Domain

public enum AuthenticationTarget {
    case guestSession
    case requestToken
    case createSessionForRequestToken(String)
    case authenticateTokenWithCredentials(Credentials)
    case deleteSession(id: String)
}

extension AuthenticationTarget: TMDBApiFriendly {

    public var api: String {
        return "authentication"
    }

    public var version: String {
        return "3"
    }

    public var path: String {
        switch self {
        case .guestSession:
            return "\(version)/\(api)/guest_session/new"
        case .requestToken:
            return "\(version)/\(api)/token/new"
        case .createSessionForRequestToken:
            return "\(version)/\(api)/session/new"
        case .authenticateTokenWithCredentials:
            return "\(version)/\(api)/token/validate_with_login"
        case .deleteSession:
            return "\(version)/\(api)/session"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .guestSession, .requestToken:
            return .get
        case .createSessionForRequestToken, .authenticateTokenWithCredentials:
            return .post
        case .deleteSession:
            return .delete
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .guestSession, .requestToken:
            return .requestPlain
        case .createSessionForRequestToken(let token):
            return .requestParameters(parameters: ["request_token": token], encoding: JSONEncoding.default)
        case .authenticateTokenWithCredentials(let credentials):
            return .requestJSONEncodable(credentials)
        case .deleteSession(let id):
            return .requestParameters(parameters: ["session_id": id], encoding: JSONEncoding.default)
        }
    }
}

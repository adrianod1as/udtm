//
//  UserAuthorization.swift
//  Domain
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public struct UserAuthorization {

    public let requestToken: String
    public let allowingURL: URL

    public init(requestToken: String, allowingURL: URL) {
        self.requestToken = requestToken
        self.allowingURL = allowingURL
    }

}

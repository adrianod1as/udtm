//
//  RequestToken.swift
//  Domain
//
//  Created by Adriano Dias on 09/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

/*
{
    "success": true,
    "expires_at": "2016-08-26 17:04:39 UTC",
    "request_token": "ff5c7eeb5a8870efe3cd7fc5c282cffd26800ecd"
}
*/

public struct RequestToken: Codable {

    public let expiration: String
    public let code: String

    enum CodingKeys: String, CodingKey {
        case code = "request_token"
        case expiration = "expires_at"
    }

    public init(code: String, expiration: String) {
        self.expiration = expiration
        self.code = code
    }
}

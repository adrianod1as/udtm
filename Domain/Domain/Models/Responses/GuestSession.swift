//
//  GuestSession.swift
//  Domain
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

/*
 {
    "guest_session_id": "1ce82ec1223641636ad4a60b07de3581",
    "expires_at": "2016-08-27 16:26:40 UTC"
 }
 */
public struct GuestSession: Codable {

    public let id: String
    public let expiration: String

    enum CodingKeys: String, CodingKey {
        case id = "guest_session_id"
        case expiration = "expires_at"
    }

    public init(id: String, expiration: String) {
        self.expiration = expiration
        self.id = id
    }
}

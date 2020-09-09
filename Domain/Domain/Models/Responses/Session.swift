//
//  Session.swift
//  Domain
//
//  Created by Adriano Dias on 09/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

/*
{
    "success": true,
    "session_id": "79191836ddaa0da3df76a5ffef6f07ad6ab0c641"
}
*/
public struct UserSession: Codable {

    public let id: String

    enum CodingKeys: String, CodingKey {
        case id = "session_id"
    }

    public init(id: String) {
        self.id = id
    }
}

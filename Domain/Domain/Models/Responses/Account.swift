//
//  Account .swift
//  Domain
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

/*
{
    "avatar": {
        "gravatar": {
            "hash": "c9e9fc152ee756a900db85757c29815d"
        }
    },
    "id": 548,
    "iso_639_1": "en",
    "iso_3166_1": "CA",
    "name": "Travis Bell",
    "include_adult": true,
    "username": "travisbell"
}
*/

public struct Account: Codable {

    public let id: String
    public let name: String
    public let username: String

    public init(id: String, name: String, username: String) {
        self.id = id
        self.name = name
        self.username = username
    }
}

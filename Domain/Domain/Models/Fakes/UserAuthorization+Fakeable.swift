//
//  UserAuthorization+Fakeable.swift
//  Domain
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Fakery

extension UserAuthorization: Fakeable {

    public var shouldBeUnique: Bool {
        true
    }

    public var uniquesId: [String] {
        [requestToken]
    }

    public static func getFakedItem() -> UserAuthorization {
        UserAuthorization(requestToken: Faker.brazilian.number.randomInt().description,
                          allowingURL: URL(string: "https://www.apple.com/")!)
    }
}

//
//  Credentials+Fakeable.swift
//  Domain
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Fakery

extension Credentials: Fakeable {

    public var shouldBeUnique: Bool {
        true
    }

    public var uniquesId: [String] {
        [username]
    }

    public static func getFakedItem() -> Credentials {
        let faker = Faker.brazilian
        return Credentials(username: faker.internet.username(),
                           password: faker.internet.password(),
                           requestToken: faker.internet.password())
    }

}

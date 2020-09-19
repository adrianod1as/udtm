//
//  Account+Fakeable.swift
//  Domain
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Fakery

extension Account: Fakeable {

    public var shouldBeUnique: Bool {
        true
    }

    public var uniquesId: [String] {
        [id, username]
    }

    public static func getFakedItem() -> Account {
        let faker = Faker.brazilian
        return Account(id: faker.number.randomInt().description,
                       name: faker.name.givenName(), username: faker.internet.username())
    }
}

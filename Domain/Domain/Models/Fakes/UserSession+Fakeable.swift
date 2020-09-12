//
//  UserSession+Fakeable.swift
//  Domain
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Fakery

extension UserSession: Fakeable {

    public var shouldBeUnique: Bool {
        true
    }

    public var uniquesId: [String] {
        [id]
    }

    public static func getFakedItem() -> UserSession {
        UserSession(id: Faker.brazilian.number.randomInt().description)
    }
}


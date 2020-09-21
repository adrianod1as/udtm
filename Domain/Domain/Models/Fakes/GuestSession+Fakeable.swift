//
//  GuestSession.swift
//  Domain
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Fakery
import SwiftDate

extension GuestSession: Fakeable {

    public var shouldBeUnique: Bool {
        true
    }

    public var uniquesId: [String] {
        [id]
    }

    public static func getFakedItem() -> GuestSession {
        GuestSession(id: Faker.brazilian.number.randomInt().description, expiration: (Date.today + 7.days).brazilFormat)
    }
}

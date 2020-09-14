//
//  RequesToken+Fakeable.swift
//  Domain
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Fakery
import SwiftDate

extension RequestToken: Fakeable {

    public var shouldBeUnique: Bool {
        true
    }

    public var uniquesId: [String] {
        [code]
    }

    public static func getFakedItem() -> RequestToken {
        RequestToken(code: Faker.brazilian.number.randomInt().description,
                     expiration: (Date.today + 7.days).brazilFormat)
    }
}

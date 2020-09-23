//
//  Gravatar+Fakeable.swift
//  Domain
//
//  Created by Adriano Dias on 23/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Fakery

extension Gravatar: Fakeable {

    public var shouldBeUnique: Bool {
        true
    }

    public var uniquesId: [String] {
        [hash]
    }

    public static func getFakedItem() -> Gravatar {
        return Gravatar(hash: L10n.Gravatar.Sample.hash)
    }

}

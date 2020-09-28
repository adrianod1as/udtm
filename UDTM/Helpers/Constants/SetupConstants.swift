//
//  SetupConstants.swift
//  UDTM
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import Networking
import OxeNetworking
import Keys

struct SetupConstants {

    static let group: String = {
        return L10n.App.group
    }()

    static let identifier: String = {
        return L10n.App.identifier
    }()

    static let defaultEnvironmentType: EnvironmentType = {
        return .development
    }()

    static let defaultFixturesType: FixturesType = .none

    static let commonHeaders: Headers = {
        return [L10n.Headers.Keys.accept: L10n.Headers.Values.jsonApplication]
    }()

    static let tmdbHeaders: Headers = {
        return [L10n.Headers.Keys.contentType: L10n.Headers.Values.jsonContentType,
                L10n.Headers.Keys.authorization: L10n.Headers.Values.bearer(MyApplicationKeys().tMBDAcessToken)]
    }()

    static let specificHeaders: SpecificHeaders = {
        return [SpecificHeaderType.tmdb.key: tmdbHeaders]
    }()

    static let environment: Environment = {
        return Environment(type: defaultEnvironmentType, fixturesType: defaultFixturesType,
                           commonHeaders: commonHeaders, specificHeaders: specificHeaders)
    }()
}

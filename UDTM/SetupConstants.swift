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

struct SetupConstants {

    static let defaultEnvironmentType: EnvironmentType = {
        return .development
    }()

    static let defaultFixturesType: FixturesType = .none

    static let commonHeaders: Headers = {
        return ["accept": "application/json"]
    }()

    static let specificHeaders: SpecificHeaders = {
        return [:]
    }()

    static let environment: Environment = {
        return Environment(type: defaultEnvironmentType, fixturesType: defaultFixturesType,
                           commonHeaders: commonHeaders, specificHeaders: specificHeaders,
                           serverTrustManager: Certificates.serverTrustManager)
    }()
}

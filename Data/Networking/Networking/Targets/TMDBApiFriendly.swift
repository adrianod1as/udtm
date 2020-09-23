//
//  TMDBApiFriendly.swift
//  Networking
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import Moya
import OxeNetworking

public protocol TMDBApiFriendly: SampleHeadersReturning, HigherLayerHeadersSpecifyable, KeyPathable {

}

extension TMDBApiFriendly {

    // swiftlint:disable force_https
    public var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/")!
    }

    public var specificHeaderTypes: [HeaderSpecifying] {
        return [SpecificHeaderType.tmdb]
    }

    public var keyPathForData: String? {
        return nil
    }

    public var validationType: ValidationType {
        return .successAndRedirectCodes
    }

    public var headers: Headers {
        return nil
    }
}

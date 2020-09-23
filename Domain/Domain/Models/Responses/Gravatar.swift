//
//  Gravatar.swift
//  Domain
//
//  Created by Adriano Dias on 22/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

/*
"avatar": {
    "gravatar": {
        "hash": "c9e9fc152ee756a900db85757c29815d"
    }
}
*/

public struct Gravatar: Codable {

    public let hash: String

    enum CodingKeys: String, CodingKey {
        case hash
        case gravatar
    }

    public init(hash: String) {
        self.hash = hash
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let gravatar = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .gravatar)
        self.hash = try gravatar.decode(String.self, forKey: .hash)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var gravatar =  container.nestedContainer(keyedBy: CodingKeys.self, forKey: .gravatar)
        try gravatar.encode(hash, forKey: .hash)
    }

}

public extension Gravatar {

    var asUrl: URL? {
        return URL(string: L10n.Gravatar.ImageRequest.url(hash))
    }
}

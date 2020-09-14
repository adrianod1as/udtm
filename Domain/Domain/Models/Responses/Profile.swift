//
//  Profile.swift
//  Domain
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

public struct UserProfile: Codable {

    public let id: String

    public init(id: String) {
        self.id = id
    }
}

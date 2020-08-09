//
//  LocalizedRecord.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public struct LocalizedRecord: Codable {

    public let updateTime: String
    public let messages: [Localized]

    public init(updateTime: String, messages: [Localized]) {
        self.updateTime = updateTime
        self.messages = messages
    }
}

extension LocalizedRecord: Equatable {

    static public func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.updateTime == rhs.updateTime
    }

}

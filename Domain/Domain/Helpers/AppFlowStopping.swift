//
//  AppFlowStopping.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public protocol AppFlowStopping {

    var code: String { get }
    var shouldStopAppFlow: Bool { get }
    var stoppingCodeInitials: [String] { get }
}

public extension AppFlowStopping {

    var stoppingCodeInitials: [String] {
        return ["W", "E", "C"]
    }

    var shouldStopAppFlow: Bool {
        guard let character = code.first else {
            return false
        }
        let firstLetter = String(character)
        return Int(firstLetter) != nil
                || stoppingCodeInitials.map({ $0.uppercased() }).contains(firstLetter.uppercased())
    }

    var isError: Bool {
        return code.first?.uppercased() == "E" || code.first?.uppercased() == "C"
    }

    var isWarning: Bool {
        return code.first?.uppercased() == "W"
    }

    var isInfo: Bool {
        return code.first?.uppercased() == "I"
    }
}

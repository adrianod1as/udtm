//
//  Array+Ext.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

extension Array: AppFailure where Element: AppFailure {

    public var appFlowInterruptingFirst: Element? {
        return filter({ $0.shouldStopAppFlow }).first
    }

    public var code: String {
        return appFlowInterruptingFirst?.code ?? L10n.Symbol.empty
    }

    public var failureReason: String? {
        return appFlowInterruptingFirst?.failureReason
    }

    public var errorDescription: String? {
        return appFlowInterruptingFirst?.errorDescription
    }
}

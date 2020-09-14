//
//  Validation+Collection.swift
//  Domain
//
//  Created by Adriano Dias on 10/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public extension Validation where Value: Collection {

    static func nonEmpty(error: Error = InteractionError.invalidInput(L10n.Error.Message.requiment)) -> Validation {
        return .init { $0.isEmpty ? .failure(error) : .success(()) }
    }
}

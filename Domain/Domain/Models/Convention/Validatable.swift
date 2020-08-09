//
//  Validatable
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public typealias ValidationResult = Result<Void, Error>

internal protocol Validatable {

    associatedtype ValidationError: LocalizedError
    var validations: [ValidationResult] { get }
}

internal extension Validatable {

    var errors: [Error] {
        return validations.compactMap({ $0.failure })
    }

    var isValid: Bool {
        return errors.isEmpty
    }

}

public extension ValidationResult {

    var isValid: Bool {
        return failure == nil && success != nil
    }
}

//
//  XCTestCase+Ext.swift
//  DomainTests
//
//  Created by Adriano Dias on 09/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import Domain

extension XCTestCase {

    func merge(sut: JSON, with json: JSON) -> JSON {
        return (try? sut.merged(with: json)) ?? JSON.null
    }

    func modelMerged<T: Codable & Fakeable>(with json: JSON, of type: T.Type) -> T? {
        return merge(sut: T.getFakedItem().json, with: json).decode(T.self)
    }

    func errorValidation(validation: ValidationResult, errorMessage: String) {
        XCTAssertEqual((validation.failure as? LocalizedError)?.failureReason, L10n.Error.Title.ops)
        XCTAssertEqual((validation.failure as? LocalizedError)?.errorDescription, errorMessage)
    }
}

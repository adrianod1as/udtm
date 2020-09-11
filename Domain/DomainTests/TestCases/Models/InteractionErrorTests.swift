//
//  InteractionErrorTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 11/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class InteractionErrorTests: XCTestCase {

    private var sut: InteractionError!
    private let dummyError: (failureReason: String, errorDescription: String) = (L10n.Error.Title.ops, "message")
    private let dummyLocalizeds = [Localized.unexpected]

    override func setUp() {
        super.setUp()

        sut = .invalidInput(dummyError.errorDescription)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFailureReason() {
        XCTAssertEqual(sut.failureReason, dummyError.failureReason)
        sut = .appFailure(dummyLocalizeds)
        XCTAssertEqual(sut.failureReason, dummyLocalizeds.failureReason)
    }

    func testErrorDescription() {
        XCTAssertEqual(sut.errorDescription, dummyError.errorDescription)
        sut = .appFailure(dummyLocalizeds)
        XCTAssertEqual(sut.errorDescription, dummyLocalizeds.errorDescription)
        sut = InteractionError.none
        XCTAssertEqual(sut.errorDescription, L10n.Symbol.empty)
    }

    func testLocalizeds() {
        XCTAssertEqual(sut.localizeds, [])
        sut = .appFailure(dummyLocalizeds)
        XCTAssertEqual(sut.localizeds, dummyLocalizeds)
    }

    func testCode() {
        sut = .appFailure(dummyLocalizeds)
        XCTAssertEqual(sut.localizeds.code, dummyLocalizeds.code)
    }
}


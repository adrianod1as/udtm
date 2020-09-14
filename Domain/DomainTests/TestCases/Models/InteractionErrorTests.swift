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
    private let stubError: (failureReason: String, errorDescription: String) = (L10n.Error.Title.ops, "message")
    private let stubLocalizeds = [Localized.unexpected]

    override func setUp() {
        super.setUp()

        sut = .invalidInput(stubError.errorDescription)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFailureReason() {
        XCTAssertEqual(sut.failureReason, stubError.failureReason)
        sut = .appFailure(stubLocalizeds)
        XCTAssertEqual(sut.failureReason, stubLocalizeds.failureReason)
    }

    func testErrorDescription() {
        XCTAssertEqual(sut.errorDescription, stubError.errorDescription)
        sut = .appFailure(stubLocalizeds)
        XCTAssertEqual(sut.errorDescription, stubLocalizeds.errorDescription)
        sut = InteractionError.none
        XCTAssertEqual(sut.errorDescription, L10n.Symbol.empty)
    }

    func testLocalizeds() {
        XCTAssertEqual(sut.localizeds, [])
        sut = .appFailure(stubLocalizeds)
        XCTAssertEqual(sut.localizeds, stubLocalizeds)
    }

    func testCode() {
        sut = .appFailure(stubLocalizeds)
        XCTAssertEqual(sut.localizeds.code, stubLocalizeds.code)
    }
}

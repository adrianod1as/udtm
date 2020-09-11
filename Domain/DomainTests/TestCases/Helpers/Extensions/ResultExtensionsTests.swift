//
//  ResultExtensionsTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 11/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class ResultExtensionsTests: XCTestCase {

    private var sut: Result<String, Error>!

    override func setUp() {
        super.setUp()

    }

    override func tearDown() {
        super.tearDown()
    }

    func testSuccess() {
        let dummy = L10n.Symbol.locale
        sut = .success(dummy)
        XCTAssertEqual(sut.success, dummy)
        XCTAssertNil(sut.failure)
    }

    func testFailure() {
        let dummy = InteractionError.failedRequest(L10n.Error.Message.email)
        sut = .failure(dummy)
        XCTAssertEqual(sut.failure?.localizedDescription, dummy.localizedDescription)
        XCTAssertNil(sut.success)
    }
}


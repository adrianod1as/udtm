//
//  FakeryExtensionsTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
import Fakery
@testable import Domain

class FakeryExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()

    }

    func testLocale() {
        XCTAssertEqual(Faker.brazilian.locale, L10n.Symbol.locale)
    }

    func testGetFakedArray() {
        let range = Credentials.defaultRangeForArray
        let amount = 5
        XCTAssertEqual(Credentials.getFakedArray(amount: amount).count, amount)
        XCTAssertTrue(range.contains(Credentials.getFakedArray(range: range).count))
        XCTAssertTrue(range.contains(Credentials.getFakedArray(min: range.lowerBound, max: range.upperBound).count))
        XCTAssertTrue(range.contains([Credentials].getFakedItem().count))
    }

    func testRandomCpf() {
        XCTAssertTrue(Faker.brazilian.number.randomCpf().isValidCPF)
    }

}

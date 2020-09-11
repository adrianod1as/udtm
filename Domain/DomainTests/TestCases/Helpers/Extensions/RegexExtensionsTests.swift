//
//  RegexExtensionsTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class RegexExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testInit() {
        do {
            let atLeastOneLowercaseLetter = try NSRegularExpression(pattern: .atLeastOneLowercaseLetter)
            let atLeastOneLetter = try NSRegularExpression(pattern: .atLeastOneLetter)
            XCTAssertEqual(atLeastOneLowercaseLetter, NSRegularExpression(.atLeastOneLowercaseLetter))
            XCTAssertEqual(atLeastOneLetter, NSRegularExpression(.atLeastOneLetter))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testMatches() {
        XCTAssertTrue(NSRegularExpression(.atLeastOneLowercaseLetter).matches("1284j8"))
        XCTAssertTrue(NSRegularExpression(.atLeastOneLowercaseLetter).matches("OPLSJj"))
        XCTAssertFalse(NSRegularExpression(.atLeastOneLowercaseLetter).matches("12848"))
        XCTAssertFalse(NSRegularExpression(.atLeastOneLowercaseLetter).matches("OPLSJ"))
        XCTAssertTrue("1284j8" ~= .atLeastOneLowercaseLetter)
        XCTAssertTrue("OPLSJj" ~= .atLeastOneLowercaseLetter)
        XCTAssertFalse("12848" ~= .atLeastOneLowercaseLetter)
        XCTAssertFalse("OPLSJ" ~= .atLeastOneLowercaseLetter)
    }

}


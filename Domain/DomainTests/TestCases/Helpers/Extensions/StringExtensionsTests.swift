//
//  StringExtensionsTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class StringExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testLeftPadding() {
        XCTAssertEqual("1234".leftPadding(toLength: 8, withPad: "0"), "00001234")
        XCTAssertEqual("1234".leftPadding(toLength: 4, withPad: "0"), "1234")
    }

    func testDigits() {
        XCTAssertEqual("1-2-&-5-8".digits, [1, 2, 5, 8])
    }

    func testDjb2hash() {
        XCTAssertEqual("1-2-&-5-8".djb2hash, 249811095800369423)
    }

    func testNoWhiteSpaces() {
        let withSpaces = "who am I   "
        let withoutSpaces = "who am I"
        XCTAssertEqual(withSpaces.noWhiteSpaces, withoutSpaces)
    }

    func testWords() {
        let s04e07 = "Proxy Authentication Required"
        let finale = "Hello, Eliot"
        XCTAssertEqual(s04e07.words.count, 3)
        XCTAssertEqual(finale.words.count, 2)
    }

    func testNumbers() {
        let episode = "405 Method Not Allowed"
        XCTAssertEqual(episode.numbers, [4, 0, 5])
        let mr = "726f626f74"
        XCTAssertEqual(mr.numbers, [7, 2, 6, 6, 2, 6, 7, 4])
    }

    func testIsRepeating() {
        let a = "aaaaaaaaaaaa"
        let ab = "aaaaaaaaaaaab"
        XCTAssertTrue(a.isRepeating)
        XCTAssertFalse(ab.isRepeating)
    }

    func testIsValidCpf() {
        let valid = "42330338007"
        let invalid = "42330338004"
        let insufficient = "4233033800"
        XCTAssertTrue(valid.isValidCPF)
        XCTAssertFalse(invalid.isValidCPF)
        XCTAssertFalse(insufficient.isValidCPF)
    }

    func testIsValidCnpj() {
        let valid = "89233491000124"
        let invalid = "89233491000122"
        let insufficient = "8923349100012"
        XCTAssertTrue(valid.isValidCNPJ)
        XCTAssertFalse(invalid.isValidCNPJ)
        XCTAssertFalse(insufficient.isValidCNPJ)
    }

    func testSubscriptNSRange() {
        let nsRange = NSRange(location: 4, length: 6)
        let s04e01 = "401 Unauthorized"
        XCTAssertEqual(s04e01[nsRange], "Unauth")
    }
}


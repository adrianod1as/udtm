//
//  NumberExtensionsTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class NumberExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetRealCurrency() {
        let number: NSNumber = 3.75
        XCTAssertEqual(number.asReal, "R$ 3,75")
        XCTAssertEqual(number.asRealNoSpace, "R$3,75")
        XCTAssertEqual(number.asRealNoSymbol, " 3,75")
        XCTAssertEqual(number.asRealNoSymbolSpace, "3,75")
    }

    func testPercentage() {
        let number: NSNumber = 35.789
        XCTAssertEqual(number.asPercentage, "35,79")
        XCTAssertEqual(number.percentage, "35,79%")
        XCTAssertEqual(number.amPercentage, "35,79% a.m")
    }

    func testRoundToDecimal() {
        XCTAssertEqual(99.99849.roundToDecimal(3), 99.998)
        XCTAssertEqual(99.99850.roundToDecimal(3), 99.999)
        XCTAssertEqual(99.9849.brlBankingCurrency, 99.98)
        XCTAssertEqual(99.9850.brlBankingCurrency, 99.99)
    }

    func testDoubleNumber() {
        let double: Double = 99
        let number: NSNumber = 99
        XCTAssertEqual(double.number, number)
    }

    func testDecimalNumber() {
        let decimal: Decimal = 99
        let number: NSDecimalNumber = 99
        XCTAssertEqual(decimal.number, number)
    }

    func testCollectionInt8() {
        let int8: [UInt8] = [9, 2, 4, 7, 8]
        XCTAssertEqual(int8.string, "92478")
        XCTAssertEqual(int8.attributedString, NSAttributedString(string: "92478"))
        XCTAssertEqual(int8.decimal, 92478)
    }

    func testAsAlphabeticUpperLetter() {
        let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N",
                        "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"].enumerated()
        alphabet.forEach { (index, letter) in
            XCTAssertEqual(index.asAlphabeticUpperLetter, letter)
        }
    }
}


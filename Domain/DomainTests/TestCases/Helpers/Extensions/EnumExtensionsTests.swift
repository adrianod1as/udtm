//
//  EnumExtensionsTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 09/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class EnumExtensionsTests: XCTestCase {

    enum Sut: String, CaseIterable {
        case first, second, third
    }

    private var sut: Sut!

    override func setUp() {
        super.setUp()

        sut = .second
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPreviousCase() {
        XCTAssertEqual(sut.previous(), Sut.first)
    }

    func testNextCase() {
        XCTAssertEqual(sut.next(), Sut.third)
    }
}

//
//  EncodableTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 11/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class EncodableExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testData() {
        let sut = Account(id: "String", name: "String", username: "String", avatar: Gravatar(hash: ""))
        XCTAssertNotNil(sut.data)
    }

    func testJSON() {
        let sut = UserSession(id: "id")
        XCTAssertNotNil(sut.json)
    }

    func testRawObject() {
        let sut = RequestToken(code: "String", expiration: "String")
        XCTAssertNotNil(sut.rawObject)
    }

}

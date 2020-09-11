//
//  AppFlowStoppingTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class AppFlowStoppingTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()

    }

    func testShouldStopAppFlow() {
        let empty = Localized(code: "", message: "")
        let warning = Localized(code: "W404", message: "")
        let error = Localized(code: "E404", message: "")
        let information = Localized(code: "I404", message: "")
        XCTAssertTrue(warning.shouldStopAppFlow)
        XCTAssertTrue(error.shouldStopAppFlow)
        XCTAssertFalse(information.shouldStopAppFlow)
        XCTAssertFalse(empty.shouldStopAppFlow)
    }

}

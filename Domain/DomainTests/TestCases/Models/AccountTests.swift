//
//  AccountTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
import Fakery
@testable import Domain

class AccountTests: XCTestCase {

    private var sut: Account!

    override func setUp() {
        super.setUp()

        sut = Account(id: "", name: "", username: "")
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFailureReason() {
        let error = sut.idValidation.failure as? LocalizedError
        XCTAssertEqual(error?.failureReason, L10n.Error.Title.ops)
    }

    func testErrorDescription() {
        XCTAssertEqual(sut.idValidation.failure?.localizedDescription, L10n.Error.Message.requiment)
    }

    func testValidations() {
        let validationMesssages = sut.validations.compactMap({ $0.failure?.localizedDescription })
        let failureMessages = [sut.idValidation].compactMap({ $0.failure?.localizedDescription })
        XCTAssertEqual(validationMesssages, failureMessages)
    }

}

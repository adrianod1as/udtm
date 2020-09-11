//
//  CredentialsTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
import Fakery
@testable import Domain

class CredentialsTests: XCTestCase {

    private var sut: Credentials!

    override func setUp() {
        super.setUp()

        sut = Credentials.getFakedItem()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSetRequestToken() {
        let requestToken = Faker.brazilian.internet.password()
        sut.set(requestToken: requestToken)
        XCTAssertEqual(sut.requestToken, requestToken)
    }

    func testSettingRequestToken() {
        let requestToken = Faker.brazilian.internet.password()
        let credentials = sut.setting(requestToken: requestToken)
        XCTAssertEqual(credentials.requestToken, requestToken)
        XCTAssertEqual(credentials.username, sut.username)
        XCTAssertEqual(credentials.password, sut.password)
    }

    func testFailureReason() {
        sut = Credentials(username: "", password: "", requestToken: "")
        let error = sut.usernameValidation.failure as? LocalizedError
        XCTAssertEqual(error?.failureReason, L10n.Error.Title.ops)
    }

    func testErrorDescription() {
        let sut = Credentials(username: "", password: "", requestToken: "")
        XCTAssertEqual(sut.usernameValidation.failure?.localizedDescription, L10n.Error.Message.requiment)
        XCTAssertEqual(sut.passwordValidation.failure?.localizedDescription, L10n.Error.Message.requiment)
    }

    func testValidations() {
        sut = Credentials(username: "", password: "", requestToken: "")
        let validationMesssages = sut.validations.compactMap({ $0.failure?.localizedDescription })
        let failureMessages = [sut.usernameValidation, sut.passwordValidation]
                                .compactMap({ $0.failure?.localizedDescription })
        XCTAssertEqual(validationMesssages, failureMessages)
    }

}

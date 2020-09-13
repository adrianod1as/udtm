//
//  AuthenticateCredentialsUseCaseTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class AuthenticateCredentialsUseCaseTestsTests: XCTestCase {

    private var sut: AuthenticateCredentialsUseCase!
    private var spy: AuthenticationRepositorySpy!

    override func setUp() {
        super.setUp()

        spy = AuthenticationRepositorySpy()
        sut = AuthenticateCredentialsUseCase(repository: spy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSuccessfulExecution() {
        sut.execute(Credentials.getFakedItem(), shouldSaveSession: true) { _ in }
        XCTAssert(spy.authenticateCredentialsCalled)
    }

    func testFailedExecution() {
        sut.execute(Credentials(username: "", password: "", requestToken: ""), shouldSaveSession: true) { result in
            XCTAssertNotNil(result.failure)
            XCTAssertNil(result.success)
        }
        XCTAssertFalse(spy.authenticateCredentialsCalled)
    }
}

//
//  AuthenticateAccountUseCaseTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class AuthenticateAccountUseCaseTests: XCTestCase {

    private var sut: AuthenticateAccountUseCase!
    private var spy: AuthenticationRepositorySpy!

    override func setUp() {
        super.setUp()

        spy = AuthenticationRepositorySpy()
        sut = AuthenticateAccountUseCase(repository: spy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSuccessfulExecution() {
        sut.execute(Account.getFakedItem()) { _ in }
        XCTAssert(spy.authenticateAccountCalled)
    }

    func testFailedExecution() {
        sut.execute(Account(id: "", name: "", username: "", avatar: Gravatar(hash: ""))) { result in
            XCTAssertNotNil(result.failure)
            XCTAssertNil(result.success)
        }
        XCTAssertFalse(spy.authenticateAccountCalled)
    }
}

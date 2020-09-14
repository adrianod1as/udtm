//
//  AuthenticateUserPermissionUseCaseTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class AuthenticateUserPermissionUseCaseTests: XCTestCase {

    private var sut: AuthenticateUserPermissionUseCase!
    private var spy: AuthenticationRepositorySpy!

    override func setUp() {
        super.setUp()

        spy = AuthenticationRepositorySpy()
        sut = AuthenticateUserPermissionUseCase(repository: spy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSuccessfulExecution() {
        sut.execute("requestToken", ["key": "value"], shouldSaveSession: true) { _ in }
        XCTAssert(spy.authenticateUserPermissionCalled)
    }

    func testFailedExecution() {
        sut.execute("requestToken", [:], shouldSaveSession: true) { result in
            XCTAssertNotNil(result.failure)
            XCTAssertNil(result.success)
        }
        XCTAssertFalse(spy.authenticateUserPermissionCalled)
    }
}

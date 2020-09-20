//
//  UserAuthorizationUseCaseTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class UserAuthorizationUseCaseTests: XCTestCase {

    private var sut: UserAuthorizationUseCase!
    private var spy: AuthenticationRepositorySpy!

    override func setUp() {
        super.setUp()

        spy = AuthenticationRepositorySpy()
        sut = UserAuthorizationUseCase(repository: spy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSuccessfulExecution() {
        sut.execute { _ in }
        XCTAssert(spy.createUserAuthorizationCalled)
    }
}

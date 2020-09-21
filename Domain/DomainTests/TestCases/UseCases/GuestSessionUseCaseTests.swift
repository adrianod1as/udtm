//
//  GuestSessionUseCaseableCaseTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class GuestSessionUseCaseTests: XCTestCase {

    private var sut: GuestSessionUseCase!
    private var spy: AuthenticationRepositorySpy!

    override func setUp() {
        super.setUp()

        spy = AuthenticationRepositorySpy()
        sut = GuestSessionUseCase(repository: spy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSuccessfulExecution() {
        sut.execute { _ in }
        XCTAssert(spy.guestSessionCalled)
    }
}

//
//  RequestTokenToBeAllowedUseCaseTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class RequestTokenToBeAllowedUseCaseTests: XCTestCase {

    private var sut: RequestTokenToBeAllowedUseCase!
    private var spy: AuthenticationRepositorySpy!

    override func setUp() {
        super.setUp()

        spy = AuthenticationRepositorySpy()
        sut = RequestTokenToBeAllowedUseCase(repository: spy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSuccessfulExecution() {
        sut.execute { _ in }
        XCTAssert(spy.createRequestTokenToBeAllowedByUserCalled)
    }
}



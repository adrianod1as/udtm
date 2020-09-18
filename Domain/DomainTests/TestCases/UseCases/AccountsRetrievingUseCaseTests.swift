//
//  AccountsRetrievingUseCaseTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class AccountsRetrievingUseCaseTests: XCTestCase {

    private var sut: AccountsRetrievingUseCase!
    private var spy: AccountsRepositorySpy!

    override func setUp() {
        super.setUp()

        spy = AccountsRepositorySpy()
        sut = AccountsRetrievingUseCase(repository: spy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSuccessfulExecution() {
        sut.execute { _ in }
        XCTAssert(spy.getAccounts)
    }
}

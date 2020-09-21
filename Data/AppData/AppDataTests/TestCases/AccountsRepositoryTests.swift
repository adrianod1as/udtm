//
//  AccountsRepositoryTests.swift
//  AppDataTests
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain
@testable import AppData

class AccountsRepositoryTests: XCTestCase {

    private var sut: AppData.AccountsRepository!
    private var accountLocalDataSourceFake: AccountLocalDatSource!

    override func setUp() {
        super.setUp()

        accountLocalDataSourceFake = AccountLocalDatSourceFake()
        sut = AccountsRepository(accountLocalDataSource: accountLocalDataSourceFake)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetAccounts() {
        sut.getAccounts { result in
            XCTAssertNotNil(result.success)
        }
    }

}

//
//  AccountRemoteDataSourceTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 13/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain
@testable import Networking

class AccountRemoteDataSourceTests: XCTestCase {

    private var sut: AccountRemoteDataSource!
    private let accountStub = Account.getFakedItem()
    private var dispatcherFake: DispacherFake!

    override func setUp() {
        super.setUp()

        dispatcherFake = DispacherFake(model: accountStub)
        sut = AccountRemoteDataSource(dispatcher: dispatcherFake)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetAccount() {
        sut.getAccount(forSession: "") { result in
            XCTAssertEqual(result.success?.id, self.accountStub.id)
        }
    }

}

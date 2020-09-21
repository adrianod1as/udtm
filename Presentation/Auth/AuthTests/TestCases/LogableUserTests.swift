//
//  LogableUserTests.swift
//  AuthTests
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain
@testable import Auth

class LogableUserTests: XCTestCase {

    private var sut: LogableUser!

    override func setUp() {
        super.setUp()

    }

    override func tearDown() {
        super.tearDown()
    }

    func testUsersTitle() {
        let account = Account.getFakedItem()
        let users: [LogableUser] = [.registered(account), .new, .guest]
        let titles = [account.username, "New User", "Guest"]
        XCTAssertEqual(users.map({ $0.title }), titles)
    }

    func testNotEquatable() {
        XCTAssertNotEqual(LogableUser.new, LogableUser.guest)
        let accounts = Account.getFakedArray(amount: 2)
        if let first = accounts.first, let last = accounts.last {
            XCTAssertNotEqual(LogableUser.registered(first), LogableUser.registered(last))
        }

    }
}

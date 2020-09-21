//
//  UsersPresenterTests.swift
//  AuthTests
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain
@testable import Auth

class UsersPresenterTests: XCTestCase {

    private var sut: UsersPresenter!
    private var viewSpy: UsersViewable!
    private var coordinatorSpy: UsersSceneCoordinating!
    private var accountsRetrievingUseCaseStub: AccountsRetrievingUseCaseable!
    private var guestUseCaseStub: GuestSessionUseCaseable!
    private var accountAuthenticationUseCaseStub: AuthenticateAccountUseCaseable!

    override func setUp() {
        super.setUp()

        viewSpy = UsersViewableSpy()
        accountsRetrievingUseCaseStub = AccountsRetrievingUseCaseableStub()
        guestUseCaseStub = GuestSessionUseCaseableStub()
        accountAuthenticationUseCaseStub = AuthenticateAccountUseCaseableStub()
        coordinatorSpy = UsersSceneCoordinatingSpy()
        sut = UsersPresenter(accountsUseCase: accountsRetrievingUseCaseStub,
                             guestUseCase: guestUseCaseStub,
                             accountAuthenticationUseCase: accountAuthenticationUseCaseStub,
                             coordinator: coordinatorSpy)
        sut.attach(view: viewSpy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetUsers() {
        sut.getUsers()
        guard let view = (sut.view as? UsersViewableSpy) else {
            XCTFail("View should be castable")
            return
        }
        XCTAssertFalse(view.manageIsLoadingCalled)
    }

    func testHandleAccountSuccess() {
        sut.handleAccount(.success(Account.getFakedArray(amount: 4)))
        guard let view = (sut.view as? UsersViewableSpy) else {
            XCTFail("View should be castable")
            return
        }
        XCTAssert(view.showUsersCalled)
    }

    func testUsersForAccount() {
        let accounts = Account.getFakedArray(amount: 4)
        let users = sut.users(for: accounts)
        XCTAssertEqual(users, accounts.map({ LogableUser.registered($0) }) + LogableUser.standardUsers)
    }

    func testHandleAccountFailure() {
        sut.handleAccount(.failure(InteractionError.failedRequest("")))
        guard let view = (sut.view as? UsersViewableSpy) else {
            XCTFail("View should be castable")
            return
        }
        XCTAssertFalse(view.showUsersCalled)
        XCTAssert(view.showErrorCalled)
    }

    func testSelectNewUser() {
        sut.select(user: .new)
        guard let coordinator = (sut.coordinator as? UsersSceneCoordinatingSpy) else {
            XCTFail("Coordinator should be castable")
            return
        }
        XCTAssert(coordinator.showNewUserCalled)
    }

    func testSelectGuest() {
        sut.select(user: .guest)
        successulfulSignInTesting()
    }

    func testSelectRegisteredAccount() {
        sut.select(user: .registered(Account.getFakedItem()))
        successulfulSignInTesting()
    }

    func testSignInAsGuest() {
        sut.signInAsGuest()
        guard let view = (sut.view as? UsersViewableSpy) else {
            XCTFail("View should be castable")
            return
        }
        XCTAssertFalse(view.manageIsLoadingCalled)
    }

    func testSignInAsRegisteredAccount() {
        sut.signInAsRegisteredAccount(Account.getFakedItem())
        guard let view = (sut.view as? UsersViewableSpy) else {
            XCTFail("View should be castable")
            return
        }
        XCTAssertFalse(view.manageIsLoadingCalled)
    }

    func testHandleSignInSuccess() {
        sut.handleSignIn(.success(()))
        successulfulSignInTesting()
    }

    func testHandleSignInFailure() {
        sut.handleSignIn(.failure(InteractionError.failedRequest("")))
        guard let view = (sut.view as? UsersViewableSpy) else {
            XCTFail("View should be castable")
            return
        }
        XCTAssert(view.showErrorCalled)
    }

    private func successulfulSignInTesting() {
        guard let coordinator = (sut.coordinator as? UsersSceneCoordinatingSpy) else {
            XCTFail("Coordinator should be castable")
            return
        }
        XCTAssert(coordinator.showHomeCalled)
    }
}

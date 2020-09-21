//
//  AuthenticationRepositoryTests.swift
//  AppDataTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain
@testable import AppData

class AuthenticationRepositoryTests: XCTestCase {

    private var sut: AppData.AuthenticationRepository!
    private var authLocalDataSourceFake: SessionLocalDataSource!
    private var accountLocalDataSourceFake: AccountLocalDatSource!
    private var authRemoteDataSourceFake: SessionRemoteDataSource!
    private var accountRemoteDataSourceFake: AccountRemoteDataSource!
    private let stubError = InteractionError.failedRequest("")

    override func setUp() {
        super.setUp()

        authLocalDataSourceFake = SessionLocalDataSourceFake()
        accountLocalDataSourceFake = AccountLocalDatSourceFake()
        authRemoteDataSourceFake = SessionRemoteDataSourceFake()
        accountRemoteDataSourceFake = AccountRemoteDataSourceFake()
        sut = AuthenticationRepository(authLocalDataSource: authLocalDataSourceFake,
                                       accountLocalDataSource: accountLocalDataSourceFake,
                                       authRemoteDataSource: authRemoteDataSourceFake,
                                       accountRemoteDataSource: accountRemoteDataSourceFake)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCreateRequestToken() {
        sut.createRequestToken { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testCreateUserAuthorization() {
        sut.createUserAuthorization { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testAuthenticateCredentialsSuccess() {
        sut.authenticateCredentials(Credentials.getFakedItem(), shouldSaveSession: true) { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testAuthenticateCredentialsFailure() {
        (sut.authRemoteDataSource as? SessionRemoteDataSourceFake)?
            .createRequestTokenResult = .failure(stubError)
        sut.authenticateCredentials(Credentials.getFakedItem(), shouldSaveSession: true) { result in
            XCTAssertNotNil(result.failure)
        }
    }

    func testAuthenticateCredentialsWithRequestTokenSuccess() {
        sut.authenticate(credentials: Credentials.getFakedItem(),
                         with: RequestToken.getFakedItem().code, shouldSaveSession: true) { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testAuthenticateCredentialsWithRequestTokenFailure() {
        (sut.authRemoteDataSource as? SessionRemoteDataSourceFake)?
            .createSessionForCredentialsTokenResult = .failure(stubError)
        sut.authenticate(credentials: Credentials.getFakedItem(),
                         with: RequestToken.getFakedItem().code, shouldSaveSession: true) { result in
            XCTAssertNotNil(result.failure)
        }
    }

    func testAuthenticateUserPermissionSuccess() {
        sut.authenticateUserPermission(forRequestToken: RequestToken.getFakedItem().code,
                                       headers: ["key": "value"], shouldSaveSession: true) { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testAuthenticateUserPermissionFailure() {
        (sut.authRemoteDataSource as? SessionRemoteDataSourceFake)?
            .createSessionForRequestTokenResult = .failure(stubError)
        sut.authenticateUserPermission(forRequestToken: RequestToken.getFakedItem().code,
                                       headers: ["key": "value"], shouldSaveSession: true) { result in
            XCTAssertNotNil(result.failure)
        }
    }

    func testGetAccountSuccess() {
        sut.getAccount(forSessionId: UserSession.getFakedItem().id, shouldSaveSession: true) { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testGetAccountFailure() {
        (sut.accountRemoteDataSource as? AccountRemoteDataSourceFake)?.getAccountResult = .failure(stubError)
        sut.getAccount(forSessionId: UserSession.getFakedItem().id, shouldSaveSession: true) { result in
            XCTAssertNotNil(result.failure)
        }
    }

    func testGuestSessionSuccess() {
        sut.guestSession { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testGuestSessionFailure() {
        (sut.authRemoteDataSource as? SessionRemoteDataSourceFake)?.createGuestSession = .failure(stubError)
        sut.guestSession { result in
            XCTAssertNotNil(result.failure)
        }
    }

    func testSaveAccountSuccessSavingSession() {
        sut.save(account: Account.getFakedItem(),
                 forSessionId: UserSession.getFakedItem().id, shouldSaveSession: true) { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testSaveAccountSuccessNotSavingSession() {
        sut.save(account: Account.getFakedItem(),
                 forSessionId: UserSession.getFakedItem().id, shouldSaveSession: false) { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testSaveAccountFailure() {
        (sut.accountLocalDataSource as? AccountLocalDatSourceFake)?.saveAccountResult = .failure(stubError)
        sut.save(account: Account.getFakedItem(),
                 forSessionId: UserSession.getFakedItem().id, shouldSaveSession: false) { result in
            XCTAssertNotNil(result.failure)
        }
    }

    func testSaveSessionSuccess() {
        sut.save(sessionId: UserSession.getFakedItem().id, forAccount: Account.getFakedItem()) { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testSaveSessionFailure() {
        (sut.authLocalDataSource as? SessionLocalDataSourceFake)?.saveSessionIdResult = .failure(stubError)
        sut.save(sessionId: UserSession.getFakedItem().id, forAccount: Account.getFakedItem()) { result in
            XCTAssertNotNil(result.failure)
        }
    }

    func testAuthenticateAccountSuccess() {
        sut.authenticateAccount(Account.getFakedItem()) { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testAuthenticateAccountFailure() {
        (sut.authLocalDataSource as? SessionLocalDataSourceFake)?.getSessionIdResult = .failure(stubError)
        sut.authenticateAccount(Account.getFakedItem()) { result in
            XCTAssertNotNil(result.failure)
        }
    }

}

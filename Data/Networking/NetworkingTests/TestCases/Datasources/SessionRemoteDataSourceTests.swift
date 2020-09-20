//
//  SessionRemoteDataSourceTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 13/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain
@testable import Networking

class SessionRemoteDataSourceTests: XCTestCase {

    private var sut: SessionRemoteDataSource!
    private let requestTokenStub = RequestToken.getFakedItem()
    private let sessionStub = UserSession.getFakedItem()
    private let guestStub = GuestSession.getFakedItem()
    private let headersStub = ["key": "value"]
    private let tokenErrorStub = InteractionError.failedRequest(L10n.Error.Description.Token.authentication)
    private var dispatcherFake: DispacherFake!

    override func setUp() {
        super.setUp()

    }

    override func tearDown() {
        super.tearDown()
    }

    func testCreateRequestToken() {
        dispatcherFake = DispacherFake(model: requestTokenStub)
        sut = SessionRemoteDataSource(dispatcher: dispatcherFake)

        sut.createRequestToken { result in
            XCTAssertEqual(result.success?.code, self.requestTokenStub.code)
        }
    }

    func testCreateUserAuthorizationSuccess() {
        dispatcherFake = DispacherFake(model: requestTokenStub)
        sut = SessionRemoteDataSource(dispatcher: dispatcherFake)

        sut.createUserAuthorization { result in
            XCTAssertEqual(result.success?.requestToken, self.requestTokenStub.code)
        }
    }

    func testCreateUserAuthorizationFailure() {
        dispatcherFake = DispacherFake(model: sessionStub)
        sut = SessionRemoteDataSource(dispatcher: dispatcherFake)

        sut.createUserAuthorization { result in
            XCTAssertNotNil(result.failure)
        }
    }

    func testCreateUserAuthorizationWithTokenSuccess() {
        dispatcherFake = DispacherFake(model: requestTokenStub)
        sut = SessionRemoteDataSource(dispatcher: dispatcherFake)

        sut.createUserAuthorization(with: requestTokenStub) { result in
            XCTAssertEqual(result.success?.requestToken, self.requestTokenStub.code)
        }
    }

    func testCreateUserAuthorizationWithTokenFailure() {
        dispatcherFake = DispacherFake(model: requestTokenStub)
        sut = SessionRemoteDataSource(dispatcher: dispatcherFake)

        sut.createUserAuthorization(with: RequestToken(code: "😄", expiration: "")) { result in
            XCTAssertNotNil(result.failure)
        }
    }

    func testCreateSessionForAuthenticatedRequestToken() {
        dispatcherFake = DispacherFake(model: sessionStub)
        sut = SessionRemoteDataSource(dispatcher: dispatcherFake)

        sut.createSession(forAuthenticatedRequestToken: requestTokenStub.code) { result in
            XCTAssertEqual(result.success?.id, self.sessionStub.id)
        }
    }

    func testHasUserNotAuthenticatedToken() {
        XCTAssertFalse([:].hasUserAuthenticatedToken)
    }

    func testHasUserAuthenticatedToken() {
        XCTAssert(headersStub.hasUserAuthenticatedToken)
    }

    func testCreateSessionForRequestTokenCheckingPermissionFromHeadersSuccess() {
        dispatcherFake = DispacherFake(model: sessionStub)
        sut = SessionRemoteDataSource(dispatcher: dispatcherFake)

        sut.createSession(forRequestToken: requestTokenStub.code,
                          checkingPermissionFromHeaders: headersStub) { result in
            XCTAssertEqual(result.success?.id, self.sessionStub.id)
        }
    }

    func testCreateSessionForRequestTokenCheckingPermissionFromHeadersFailure() {
        dispatcherFake = DispacherFake(model: sessionStub)
        sut = SessionRemoteDataSource(dispatcher: dispatcherFake)

        sut.createSession(forRequestToken: requestTokenStub.code,
                          checkingPermissionFromHeaders: [:]) { result in
            XCTAssertEqual(result.failure?.localizedDescription, self.tokenErrorStub.localizedDescription)
        }
    }

    func testCreateRequestTokenForCredentials() {
        dispatcherFake = DispacherFake(model: requestTokenStub)
        sut = SessionRemoteDataSource(dispatcher: dispatcherFake)

        sut.createRequestToken(forCredentials: Credentials.getFakedItem()) { result in
            XCTAssertEqual(result.success?.code, self.requestTokenStub.code)
        }
    }

    func testCreateSessionTokenForCredentialsSuccess() {
        do {
            let data = try requestTokenStub.json.merged(with: sessionStub.json).rawData()
            dispatcherFake = DispacherFake(data: data)
            sut = SessionRemoteDataSource(dispatcher: dispatcherFake)
            sut.createSession(forCredentials: Credentials.getFakedItem()) { result in
                XCTAssertEqual(result.success?.id, self.sessionStub.id)
            }
        } catch {
            XCTFail(error.localizedDescription)
        }

    }

    func testCreateSessionTokenForCredentialsFailure() {
        dispatcherFake = DispacherFake(model: sessionStub)
        sut = SessionRemoteDataSource(dispatcher: dispatcherFake)
        sut.createSession(forCredentials: Credentials.getFakedItem()) { result in
            XCTAssertNotNil(result.failure)
        }
    }

    func testGuestSession() {
        dispatcherFake = DispacherFake(model: guestStub)
        sut = SessionRemoteDataSource(dispatcher: dispatcherFake)

        sut.createGuestSession { result in
            XCTAssertEqual(result.success?.id, self.guestStub.id)
        }
    }
}

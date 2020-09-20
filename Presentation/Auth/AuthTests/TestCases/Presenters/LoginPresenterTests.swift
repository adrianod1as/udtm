//
//  LoginPresenterTests.swift
//  AuthTests
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain
@testable import Auth

class LoginPresenterTests: XCTestCase {

    private var sut: LoginPresenter!
    private var viewSpy: LoginViewable!
    private var coordinatorSpy: LoginSceneCoordinating!
    private var userPermissionAuthenticationUseCase: AuthenticateUserPermissionUseCaseable!
    private var userAuthorizationUseCase: UserAuthorizationUseCaseable!
    private var credentialsAuthenticationUseCase: AuthenticateCredentialsUseCaseable!

    override func setUp() {
        super.setUp()

        viewSpy = LoginViewableSpy()
        userPermissionAuthenticationUseCase = AuthenticateUserPermissionUseCaseableStub()
        userAuthorizationUseCase = UserAuthorizationUseCaseableStub()
        credentialsAuthenticationUseCase = AuthenticateCredentialsUseCaseableStub()
        coordinatorSpy = LoginSceneCoordinatingSpy()
        sut = LoginPresenter(userPermissionAuthenticationUseCase: userPermissionAuthenticationUseCase,
                             userAuthorizationUseCase: userAuthorizationUseCase,
                             credentialsAuthenticationUseCase: credentialsAuthenticationUseCase,
                             coordinator: coordinatorSpy)
        sut.attach(view: viewSpy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAuthenticateUserPassword() {
        let credentials = Credentials.getFakedItem()
        sut.authenticate(user: credentials.username, password: credentials.password, savingSession: true)
        manageIsLoadingTesting()
        showHomeTesting()
    }

    private func manageIsLoadingTesting() {
        guard let view = (sut.view as? LoginViewableSpy) else {
            XCTFail("View should be castable")
            return
        }
        XCTAssertFalse(view.manageIsLoadingCalled)
    }

    private func showHomeTesting() {
        guard let coordinator = (sut.coordinator as? LoginSceneCoordinatingSpy) else {
            XCTFail("View should be castable")
            return
        }
        XCTAssert(coordinator.showHomeCalled)
    }

    func testHandleCredentialsAuthenticationGeneralFailure() {
        sut.handleCredentialsAuthentication(.failure(InteractionError.failedRequest("")))
        showGeneralErrorTesting()
    }

    private func showGeneralErrorTesting() {
        guard let view = (sut.view as? LoginViewableSpy) else {
            XCTFail("View should be castable")
            return
        }
        XCTAssert(view.showGeneralErrorCalled)
    }

    func testHandleCredentialsAuthenticationUserFailure() {
        sut.handleCredentialsAuthentication(.failure(Credentials.Failure.user("")))
        guard let view = (sut.view as? LoginViewableSpy) else {
            XCTFail("View should be castable")
            return
        }
        XCTAssert(view.showUserErrorCalled)
    }

    func testHandleCredentialsAuthenticationPasswordFailure() {
        sut.handleCredentialsAuthentication(.failure(Credentials.Failure.password("")))
        guard let view = (sut.view as? LoginViewableSpy) else {
            XCTFail("View should be castable")
            return
        }
        XCTAssert(view.showPasswordErrorCalled)
    }

    func testRequestToken() {
        sut.requestToken()
        guard let view = (sut.view as? LoginViewableSpy) else {
            XCTFail("View should be castable")
            return
        }
        XCTAssertFalse(view.manageIsLoadingCalled)
        XCTAssert(view.showRequestTokenUrlCalled)
    }

    func testHandleRequestTokenFailure() {
        sut.handleRequesToken(.failure(InteractionError.failedRequest("")))
        guard let view = (sut.view as? LoginViewableSpy) else {
            XCTFail("View should be castable")
            return
        }
        XCTAssert(view.showGeneralErrorCalled)
    }

    func testAuthenticateHeaders() {
        sut.authenticate(headers: ["key": "value"], savingSession: true)
        manageIsLoadingTesting()
        showHomeTesting()
    }

    func testHandleUserPermissionAuthenticationFailure() {
        sut.handleUserPermissionAuthentication(.failure(InteractionError.failedRequest("")))
        showGeneralErrorTesting()
    }
}


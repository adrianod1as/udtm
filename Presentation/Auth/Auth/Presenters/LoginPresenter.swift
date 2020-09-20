//
//  LoginPresenter.swift
//  Auth
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain

protocol LoginPresenterHolding {

    var view: LoginViewable? { get set }
    var coordinator: LoginSceneCoordinating { get }
    var userPermissionAuthenticationUseCase: AuthenticateUserPermissionUseCaseable { get }
    var userAuthorizationUseCase: UserAuthorizationUseCaseable { get }
    var credentialsAuthenticationUseCase: AuthenticateCredentialsUseCaseable { get }
    var userAllowedRequestToken: String { get set }
    init(userPermissionAuthenticationUseCase: AuthenticateUserPermissionUseCaseable,
         userAuthorizationUseCase: UserAuthorizationUseCaseable,
         credentialsAuthenticationUseCase: AuthenticateCredentialsUseCaseable, coordinator: LoginSceneCoordinating)
    func attach(view: LoginViewable)
}

public class LoginPresenter: LoginPresenterHolding {

    internal var view: LoginViewable?
    internal let coordinator: LoginSceneCoordinating
    internal let userPermissionAuthenticationUseCase: AuthenticateUserPermissionUseCaseable
    internal let userAuthorizationUseCase: UserAuthorizationUseCaseable
    internal let credentialsAuthenticationUseCase: AuthenticateCredentialsUseCaseable
    internal var userAllowedRequestToken = ""

    public required init(userPermissionAuthenticationUseCase: AuthenticateUserPermissionUseCaseable,
                         userAuthorizationUseCase: UserAuthorizationUseCaseable,
                         credentialsAuthenticationUseCase: AuthenticateCredentialsUseCaseable,
                         coordinator: LoginSceneCoordinating) {
        self.userPermissionAuthenticationUseCase = userPermissionAuthenticationUseCase
        self.credentialsAuthenticationUseCase = credentialsAuthenticationUseCase
        self.userAuthorizationUseCase = userAuthorizationUseCase
        self.coordinator = coordinator
    }

    public func attach(view: LoginViewable) {
        self.view = view
    }

}

extension LoginPresenter: LoginViewPresenting {

    public func authenticate(user: String, password: String, savingSession: Bool) {
        let credentials = Credentials(username: user, password: password, requestToken: "")
        view?.manage(isLoading: true)
        credentialsAuthenticationUseCase.execute(credentials, shouldSaveSession: savingSession) { [weak self] result in
            guard let self = self else {
                return
            }
            self.view?.manage(isLoading: false)
            self.handleCredentialsAuthentication(result)
        }
    }

    internal func handleCredentialsAuthentication(_ result: Result<Account, Error>) {
        switch result {
        case .success:
            coordinator.showHome()
        case .failure(let error):
            handleCredentialsAuthentication(error)
        }
    }

    internal func handleCredentialsAuthentication(_ error: Error) {
        guard let failure = error as? Credentials.Failure else {
            view?.showGeneral(error: error.localizedDescription)
            return
        }
        switch failure {
        case .user(let message):
            view?.showUser(error: message)
        case .password(let message):
            view?.showPassword(error: message)
        }
    }

    public func requestToken() {
        view?.manage(isLoading: true)
        userAuthorizationUseCase.execute { [weak self] result in
            guard let self = self else {
                return
            }
            self.view?.manage(isLoading: false)
            self.handleRequesToken(result)
        }
    }

    internal func handleRequesToken(_ result: Result<UserAuthorization, Error>) {
        switch result {
        case .success(let requestTokenToBeAllowedByUser):
            userAllowedRequestToken = requestTokenToBeAllowedByUser.requestToken
            view?.showRequestToken(url: requestTokenToBeAllowedByUser.allowingURL)
        case .failure(let error):
            view?.showGeneral(error: error.localizedDescription)
        }
    }

    public func authenticate(headers: [String: String], savingSession: Bool) {
        view?.manage(isLoading: true)
        userPermissionAuthenticationUseCase.execute(userAllowedRequestToken,
                                                    headers, shouldSaveSession: savingSession) { [weak self] result in
            guard let self = self else {
                return
            }
            self.view?.manage(isLoading: false)
            self.handleUserPermissionAuthentication(result)
        }
    }

    internal func handleUserPermissionAuthentication(_ result: Result<Account, Error>) {
        switch result {
        case .success:
            coordinator.showHome()
        case .failure(let error):
            view?.showGeneral(error: error.localizedDescription)
        }
    }
}

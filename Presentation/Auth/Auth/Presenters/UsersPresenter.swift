//
//  UsersPresenter.swift
//  Auth
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain

protocol UsersPresenterHolding {

    var view: UsersViewable? { get set }
    var coordinator: UsersSceneCoordinating { get }
    var accountsRetrievingUseCase: AccountsRetrievingUseCaseable { get }
    var guestUseCase: GuestSessionUseCaseable { get }
    var accountAuthenticationUseCase: AuthenticateAccountUseCaseable { get }
    init(accountsUseCase: AccountsRetrievingUseCaseable, guestUseCase: GuestSessionUseCaseable,
         accountAuthenticationUseCase: AuthenticateAccountUseCaseable, coordinator: UsersSceneCoordinating)
    func attach(view: UsersViewable)
}

public class UsersPresenter: UsersPresenterHolding {

    internal var view: UsersViewable?
    internal let coordinator: UsersSceneCoordinating
    internal let accountsRetrievingUseCase: AccountsRetrievingUseCaseable
    internal let guestUseCase: GuestSessionUseCaseable
    internal let accountAuthenticationUseCase: AuthenticateAccountUseCaseable

    public required init(accountsUseCase: AccountsRetrievingUseCaseable,
                         guestUseCase: GuestSessionUseCaseable,
                         accountAuthenticationUseCase: AuthenticateAccountUseCaseable,
                         coordinator: UsersSceneCoordinating) {
        self.accountsRetrievingUseCase = accountsUseCase
        self.accountAuthenticationUseCase = accountAuthenticationUseCase
        self.guestUseCase = guestUseCase
        self.coordinator = coordinator
    }

    public func attach(view: UsersViewable) {
        self.view = view
    }

}

extension UsersPresenter: UsersViewPresenting {

    public func getUsers() {
        view?.manage(isLoading: true)
        accountsRetrievingUseCase.execute { [weak self] result in
            guard let self = self else {
                return
            }
            self.view?.manage(isLoading: false)
            self.handleAccount(result)
        }
    }

    internal func handleAccount(_ result: Result<[Account], Error>) {
        switch result {
        case .success(let accounts):
            view?.show(users: users(for: accounts))
        case .failure(let error):
            view?.show(error: error.localizedDescription)
        }
    }

    internal func users(for accounts: [Account]) -> [LogableUser] {
        accounts.map({ LogableUser.registered($0) }) + LogableUser.standardUsers
    }

    public func select(user: LogableUser) {
        switch user {
        case .new:
            coordinator.showNewUser()
        case .guest:
            signInAsGuest()
        case .registered(let account):
            signInAsRegisteredAccount(account)
        }
    }

    internal func signInAsGuest() {
        view?.manage(isLoading: true)
        guestUseCase.execute { [weak self] result in
            guard let self = self else {
                return
            }
            self.view?.manage(isLoading: false)
            self.handleSignInAsGuest(result)
        }
    }

    internal func signInAsRegisteredAccount(_ account: Account) {
        view?.manage(isLoading: true)
        accountAuthenticationUseCase.execute(account) { [weak self] result in
            guard let self = self else {
                return
            }
            self.view?.manage(isLoading: false)
            self.handleSignInAsRegisteredAccount(result)
        }
    }

    internal func handleSignInAsGuest(_ result: Result<Void, Error>) {
        switch result {
        case .success:
            coordinator.showHome()
        case .failure(let error):
            view?.show(error: error.localizedDescription)
        }
    }

    internal func handleSignInAsRegisteredAccount(_ result: Result<Void, Error>) {
        switch result {
        case .success:
            coordinator.showHome()
        case .failure(let error):
            view?.show(error: error.localizedDescription)
            coordinator.showNewUser()
        }
    }
}

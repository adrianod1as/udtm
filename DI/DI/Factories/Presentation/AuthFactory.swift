//
//  AuthFactory.swift
//  DI
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Auth
import Swinject
import Common

class AuthFactory {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }
}

extension AuthFactory: AuthManufacturing {

    public func makeUsersViewController() -> UsersViewController {
        guard let presenter = resolver.resolve(UsersViewPresenting.self) as? UsersPresenter else {
            preconditionFailure(Common.L10n.Resolver.SafelyResolve.preconditionFailure(UsersViewPresenting.self))
        }
        let viewController = UsersViewController(presenter: presenter)
        presenter.attach(view: viewController)
        return viewController
    }

    public func makeLoginViewController() -> LoginViewController {
        guard let presenter = resolver.resolve(LoginViewPresenting.self) as? LoginPresenter else {
            preconditionFailure(Common.L10n.Resolver.SafelyResolve.preconditionFailure(LoginViewPresenting.self))
        }
        let viewController = LoginViewController(presenter: presenter)
        presenter.attach(view: viewController)
        return viewController
    }
}

//
//  AuthAssembly.swift
//  DI
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Auth
import Swinject
import SwinjectAutoregistration

protocol AuthAssembling: Assembly {

    func assembleFactory(for container: Container)
    func coordinator(for container: Container) -> AuthCoordinator
    func assembleUsersScene(for container: Container, coordinator: UsersSceneCoordinating)
    func assembleLoginScene(for container: Container, coordinator: LoginSceneCoordinating)
}

extension AuthAssembling {

    public func assemble(container: Container) {
        assembleFactory(for: container)
        let authCoordinator = coordinator(for: container)
        assembleUsersScene(for: container, coordinator: authCoordinator)
        assembleLoginScene(for: container, coordinator: authCoordinator)
    }
}

public class AuthFlowAssembly: AuthAssembling {

    public init() {}

    func assembleFactory(for container: Container) {
        container.register(AuthManufacturing.self) { resolver in
            return AuthFactory(resolver: resolver)
        }
    }

    func coordinator(for container: Container) -> AuthCoordinator {
        container.safelyResolve(AuthCoordinator.self)
    }

    func assembleUsersScene(for container: Container, coordinator: UsersSceneCoordinating) {
        container.register(UsersSceneCoordinating.self) { _ in coordinator}
        container.autoregister(UsersViewPresenting.self, initializer: UsersPresenter.init)
    }

    func assembleLoginScene(for container: Container, coordinator: LoginSceneCoordinating) {
        container.register(LoginSceneCoordinating.self) { _ in coordinator}
        container.autoregister(LoginViewPresenting.self, initializer: LoginPresenter.init)
    }
}

//
//  CoordinatorsAssembly.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import Common
import AppNavigation
import Auth

class CoordinatorsAssembly: Assembly {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func assemble(container: Container) {
        assembleAppCoordinator(container: container)
        assembleAuthCoordinator(container: container)
    }

    internal func assembleAppCoordinator(container: Container) {
        container.register(AppCoordinator.self) { resolver in
            return AppCoordinator(navigationController: self.navigationController,
                                  factory: resolver.safelyResolve(CoordinatorManufacturing.self))
        }.implements(AuthDepartingCoordinating.self)
    }

    internal func assembleAuthCoordinator(container: Container) {
        container.register(AuthCoordinator.self) { resolver in
            return AuthCoordinator(navigationController: self.navigationController,
                                   departingCoordinator: resolver.safelyResolve(AuthDepartingCoordinating.self),
                                   factory: resolver.safelyResolve(AuthManufacturing.self))
        }
    }
}

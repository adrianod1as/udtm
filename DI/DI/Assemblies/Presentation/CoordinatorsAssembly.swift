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
import Home

class CoordinatorsAssembly: Assembly {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func assemble(container: Container) {
        assembleAppCoordinator(container: container)
        assembleAuthCoordinator(container: container)
        assembleMenuCoordinator(container: container)
        assembleHomeCoordinator(container: container)
    }

    internal func assembleAppCoordinator(container: Container) {
        container.register(AppCoordinator.self) { resolver in
            return AppCoordinator(navigationController: self.navigationController,
                                  factory: resolver.safelyResolve(CoordinatorManufacturing.self))
        }.implements(AuthDepartingCoordinating.self, MenuDepartingCoordinating.self, HomeDepartingCoordinating.self)
    }

    internal func assembleAuthCoordinator(container: Container) {
        container.register(AuthCoordinator.self) { resolver in
            return AuthCoordinator(navigationController: self.navigationController,
                                   departingCoordinator: resolver.safelyResolve(AuthDepartingCoordinating.self),
                                   factory: resolver.safelyResolve(AuthManufacturing.self))
        }
    }

    internal func assembleMenuCoordinator(container: Container) {
        container.register(MenuCoordinator.self) { resolver in
            return MenuCoordinator(navigationController: self.navigationController,
                                   departingCoordinator: resolver.safelyResolve(MenuDepartingCoordinating.self),
                                   factory: resolver.safelyResolve(MenuManufacturing.self))
        }
    }

    internal func assembleHomeCoordinator(container: Container) {
        container.register(HomeCoordinator.self) { resolver in
            let homeFactory = resolver.safelyResolve(HomeManufacturing.self)
            return HomeCoordinator(navigationController: homeFactory.makeHomeNavigationController(),
                                   departingCoordinator: resolver.safelyResolve(HomeDepartingCoordinating.self),
                                   factory: resolver.safelyResolve(HomeManufacturing.self))
        }
    }
}

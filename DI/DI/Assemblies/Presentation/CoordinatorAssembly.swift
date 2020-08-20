//
//  CoordinatorAssembly.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import AppNavigation

class CoordinatorsAssembly: Assembly {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func assemble(container: Container) {
        // MARK: - App Coordinator
        container.register(AppCoordinator.self) { resolver in
            return AppCoordinator(navigationController: self.navigationController,
                                  coordinatorFactory: resolver.safelyResolve(CoordinatorFactory.self))
        }
    }
}

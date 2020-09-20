//
//  AppCoordinator.swift
//  AppNavigation
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit
import Common
import Auth

public class AppCoordinator: Coordinator {

    weak public var coordinatorDelegate: CoordinatorDelegate?

    public var childCoordinators: [Coordinator] = []

    public var navigationController: UINavigationController

    private let factory: CoordinatorManufacturing

    public init(navigationController: UINavigationController, factory: CoordinatorManufacturing) {
        self.navigationController = navigationController
        self.factory = factory
    }

    public func start() {
        showAuthenticationFlow()
    }

    internal func showAuthenticationFlow() {
        let coordinator = factory.makeAuthCoordinator()
        coordinator.start()
    }
}

extension AppCoordinator: AuthDepartingCoordinating {

    public func showHome() {
        #warning("TO-DO: implement navigation to Home")
    }
}

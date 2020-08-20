//
//  AppCoordinator.swift
//  AppNavigation
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

public class AppCoordinator: Coordinator {

    weak public var coordinatorDelegate: CoordinatorDelegate?

    public var childCoordinators: [Coordinator] = []

    public var navigationController: UINavigationController

    private let coordinatorFactory: CoordinatorManufacturing

    public init(navigationController: UINavigationController, coordinatorFactory: CoordinatorManufacturing) {
        self.navigationController = navigationController
        self.coordinatorFactory = coordinatorFactory
    }

    public func start() {
    }
}

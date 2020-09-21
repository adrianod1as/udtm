//
//  AuthCoordinator.swift
//  Auth
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Common
import UIKit

public protocol AuthDepartingCoordinating: AnyObject {

    func showHome()
}

public class AuthCoordinator: Coordinator {

    weak public var coordinatorDelegate: CoordinatorDelegate?

    public var childCoordinators: [Coordinator] = []

    public var navigationController: UINavigationController

    private let factory: AuthManufacturing

    private weak var departingCoordinator: AuthDepartingCoordinating?

    public init(navigationController: UINavigationController,
                departingCoordinator: AuthDepartingCoordinating,
                factory: AuthManufacturing) {
        self.navigationController = navigationController
        self.departingCoordinator = departingCoordinator
        self.factory = factory
    }

    public func start() {
        showUsers()
    }

    internal func showUsers() {
        let viewController = factory.makeUsersViewController()
        navigationController.setViewControllers([viewController], animated: true)
    }
}

extension AuthCoordinator: UsersSceneCoordinating {

    public func showNewUser() {
        let viewController = factory.makeLoginViewController()
        navigationController.pushViewController(viewController, animated: true)
    }

}

extension AuthCoordinator: LoginSceneCoordinating {

    public func showHome() {
        departingCoordinator?.showHome()
    }
}

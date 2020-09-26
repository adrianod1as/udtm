//
//  MenuCoordinator.swift
//  Home
//
//  Created by Adriano Dias on 25/09/20.
//

import UIKit
import Common

public protocol MenuDepartingCoordinating: AnyObject {

}

public class MenuCoordinator: Coordinator {

    weak public var coordinatorDelegate: CoordinatorDelegate?

    public var childCoordinators: [Coordinator] = []

    public var navigationController: UINavigationController

    private let factory: MenuManufacturing

    private let departingCoordinator: MenuDepartingCoordinating

    public init(navigationController: UINavigationController,
                departingCoordinator: MenuDepartingCoordinating,
                factory: MenuManufacturing) {
        self.navigationController = navigationController
        self.departingCoordinator = departingCoordinator
        self.factory = factory
    }

    public func start() {
        UIApplication.shared.switchRootViewController(to: factory.makeTabBarController())
    }
}

extension MenuCoordinator: MenuSceneCoordinating {

}

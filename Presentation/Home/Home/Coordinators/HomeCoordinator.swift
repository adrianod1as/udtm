//
//  HomeCoordinator.swift
//  Home
//
//  Created by Adriano Dias on 24/09/20.
//

import Common
import UIKit

public protocol HomeDepartingCoordinating: AnyObject {

}

public class HomeCoordinator: Coordinator {

    weak public var coordinatorDelegate: CoordinatorDelegate?

    public var childCoordinators: [Coordinator] = []

    public var navigationController: UINavigationController

    private let factory: HomeManufacturing

    private let departingCoordinator: HomeDepartingCoordinating

    public init(navigationController: UINavigationController,
                departingCoordinator: HomeDepartingCoordinating,
                factory: HomeManufacturing) {
        self.navigationController = navigationController
        self.departingCoordinator = departingCoordinator
        self.factory = factory
    }

    public func start() {
        let tabBarController = factory.makeTabBarController()
        UIApplication.shared.windows.first?.rootViewController = tabBarController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension HomeCoordinator: HomeSceneCoordinating {

}

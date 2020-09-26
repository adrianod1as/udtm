//
//  MenuFactory.swift
//  DI
//
//  Created by Adriano Dias on 25/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Home
import Swinject
import Common
import SFSafeSymbols

class MenuFactory {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }
}

extension MenuFactory: MenuManufacturing {

    func makeTabBarController() -> UDTTabBarController {
        let tabBarController = UDTTabBarController()
        tabBarController.tabBar.barTintColor = ColorName.blackPearl
        tabBarController.tabBar.tintColor = ColorName.amethyst
        tabBarController.viewControllers = tabBarControllers
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.unselectedItemTintColor = ColorName.white
        return tabBarController
    }

    private var tabBarControllers: [UIViewController] {
        return [homeTabViewController]
    }

    private var homeTabViewController: UINavigationController {
        let factory = resolver.safelyResolve(HomeManufacturing.self)
        let navigationController = factory.makeHomeNavigationController()
        let viewController = factory.makeHomeViewController()
        viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemSymbol: .house),
                                                 selectedImage: UIImage(systemSymbol: .houseFill))
        viewController.extendedLayoutIncludesOpaqueBars = true
        navigationController.setViewControllers([viewController], animated: false)
        return navigationController
    }
}

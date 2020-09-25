//
//  HomeFactory.swift
//  DI
//
//  Created by Adriano Dias on 24/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Home
import Swinject
import Common

class HomeFactory {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }
}

extension HomeFactory: HomeManufacturing {

    func makeTabBarController() -> UDTTabBarController {
        let tabBarController = UDTTabBarController()
        tabBarController.tabBar.backgroundColor = UIColor.purpleGradient(forFrame: tabBarController.tabBar.bounds)
        tabBarController.tabBar.tintColor = ColorName.white
        tabBarController.viewControllers = tabBarControllers
        return tabBarController
    }

    private var tabBarControllers: [UIViewController] {
        let homeNavigationController = makeHomeNavigationController()
        homeNavigationController.setViewControllers([makeHomeViewController()], animated: false)
        return [homeNavigationController]
    }

    func makeHomeNavigationController() -> UINavigationController {
       UINavigationController()
    }

    func makeHomeViewController() -> HomeViewController {
        guard let presenter = resolver.resolve(HomeViewPresenting.self) as? HomePresenter else {
            preconditionFailure(Common.L10n.Resolver.SafelyResolve.preconditionFailure(HomeViewPresenting.self))
        }
        let viewController = HomeViewController(presenter: presenter)
        viewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"),
                                                 selectedImage: UIImage(systemName: "house"))
        presenter.attach(view: viewController)
        return viewController
    }
}

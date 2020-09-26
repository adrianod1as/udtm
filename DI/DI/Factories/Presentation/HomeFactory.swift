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

    func makeHomeNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.asTranslucentWithImageNavigationController()
        return navigationController
    }

    func makeHomeViewController() -> HomeViewController {
        guard let presenter = resolver.resolve(HomeViewPresenting.self) as? HomePresenter else {
            preconditionFailure(Common.L10n.Resolver.SafelyResolve.preconditionFailure(HomeViewPresenting.self))
        }
        let viewController = HomeViewController(presenter: presenter)
        presenter.attach(view: viewController)
        return viewController
    }
}

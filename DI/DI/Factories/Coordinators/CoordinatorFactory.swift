//
//  CoordinatorFactory.swift
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

public class CoordinatorFactory: DependencyManufacturing {

    private let resolver: Resolver

    public required init(resolver: Resolver) {
        self.resolver = resolver
    }

}

extension CoordinatorFactory: CoordinatorManufacturing {

    public func makeAuthCoordinator() -> AuthCoordinator {
        resolver.safelyResolve(AuthCoordinator.self)
    }

    public func makeHomeCoordinator() -> HomeCoordinator {
        resolver.safelyResolve(HomeCoordinator.self)
    }

    public func makeMenuCoordinator() -> MenuCoordinator {
        resolver.safelyResolve(MenuCoordinator.self)
    }
}

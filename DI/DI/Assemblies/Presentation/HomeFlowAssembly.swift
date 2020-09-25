//
//  HomeFlowAssembly.swift
//  DI
//
//  Created by Adriano Dias on 24/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Home
import Swinject
import SwinjectAutoregistration

protocol HomeFlowAssembling: Assembly {

    func assembleFactory(for container: Container)
    func coordinator(for container: Container) -> HomeCoordinator
    func assembleTabBarController(for container: Container)
    func assembleHomeScene(for container: Container, coordinator: HomeSceneCoordinating)
}

extension HomeFlowAssembling {

    func assemble(container: Container) {
        assembleFactory(for: container)
        let authCoordinator = coordinator(for: container)
        assembleTabBarController(for: container)
        assembleHomeScene(for: container, coordinator: authCoordinator)
    }
}

class HomeFlowAssembly {

}

extension HomeFlowAssembly: HomeFlowAssembling {

    func assembleTabBarController(for container: Container) {

    }

    func assembleFactory(for container: Container) {
        container.register(HomeManufacturing.self) { resolver in
            return HomeFactory(resolver: resolver)
        }
    }

    func coordinator(for container: Container) -> HomeCoordinator {
        container.safelyResolve(HomeCoordinator.self)
    }

    func assembleHomeScene(for container: Container, coordinator: HomeSceneCoordinating) {
        container.register(HomeSceneCoordinating.self) { _ in coordinator}
        container.autoregister(HomeViewPresenting.self, initializer: HomePresenter.init)
    }
}

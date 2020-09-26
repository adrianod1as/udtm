//
//  MenuFlowAssembly.swift
//  DI
//
//  Created by Adriano Dias on 25/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Home
import Swinject
import SwinjectAutoregistration

protocol MenuFlowAssembling: Assembly {

    func assembleFactory(for container: Container)
    func coordinator(for container: Container) -> MenuCoordinator
    func assembleTabBarController(for container: Container)
    func assembleMenuScene(for container: Container, coordinator: MenuSceneCoordinating)
}

extension MenuFlowAssembling {

    func assemble(container: Container) {
        assembleFactory(for: container)
        let authCoordinator = coordinator(for: container)
        assembleTabBarController(for: container)
        assembleMenuScene(for: container, coordinator: authCoordinator)
    }
}

class MenuFlowAssembly {

}

extension MenuFlowAssembly: MenuFlowAssembling {

    func assembleTabBarController(for container: Container) {

    }

    func assembleFactory(for container: Container) {
        container.register(MenuManufacturing.self) { resolver in
            return MenuFactory(resolver: resolver)
        }
    }

    func coordinator(for container: Container) -> MenuCoordinator {
        container.safelyResolve(MenuCoordinator.self)
    }

    func assembleMenuScene(for container: Container, coordinator: MenuSceneCoordinating) {
        container.register(MenuSceneCoordinating.self) { _ in coordinator}
    }
}

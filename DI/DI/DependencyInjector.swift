//
//  DependencyInjector.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import OxeNetworking
import AppNavigation
import Auth

public class DependencyInjector {

    private let environment: Environment

    public init(environment: Environment) {
        self.environment = environment
    }

    public func build(completion: (_ assembler: Assembler, _ appCoordinator: AppCoordinator) -> Void) {
        let assembler = Assembler([
            CoordinatorFactoryAssembly(),
            CoordinatorsAssembly(navigationController: UINavigationController()),
            AuthFlowAssembly(),
            DomainAssembly(),
            DataAssembly(),
            NetworkingAssembly(environment: environment),
            StorageAssembly()
        ])
        let appCoordinator = assembler.resolver.safelyResolve(AppCoordinator.self)
        completion(assembler, appCoordinator)
    }

}

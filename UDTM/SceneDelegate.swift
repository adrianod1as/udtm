//
//  SceneDelegate.swift
//  UDTM
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit
import Swinject
import DI
import AlamofireNetworkActivityLogger

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var assembler: Assembler?

    private lazy var dependencyInjector: DependencyInjector = {
        return DependencyInjector(environment: SetupConstants.environment,
                                  group: SetupConstants.group, identifier: SetupConstants.identifier)
    }()

    private func setupWindow(navigationController: UINavigationController, scene: UIWindowScene) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        window?.windowScene = scene
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        setupLogger()
        dependencyInjector.build { assembler, appCoordinator in
            self.assembler = assembler
            setupWindow(navigationController: appCoordinator.navigationController, scene: windowScene)
            appCoordinator.start()
        }

    }

    internal func setupLogger() {
        NetworkActivityLogger.shared.startLogging()
        NetworkActivityLogger.shared.level = .debug
    }
}

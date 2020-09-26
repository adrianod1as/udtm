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
import AppData
import AlamofireNetworkActivityLogger
import IQKeyboardManagerSwift
import SwinjectAutoregistration

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
        setupKeyboardManger()
        dependencyInjector.build { assembler, appCoordinator in
            self.assembler = assembler
            setupWindow(navigationController: appCoordinator.navigationController, scene: windowScene)
            self.manageUserInformation()
            appCoordinator.start()
        }

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        manageUserInformation()
    }

    private func setupLogger() {
        NetworkActivityLogger.shared.startLogging()
        NetworkActivityLogger.shared.level = .debug
    }

    private func setupKeyboardManger() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = false
        IQKeyboardManager.shared.toolbarPreviousNextAllowedClasses = [IQPreviousNextView.self]
        IQKeyboardManager.shared.layoutIfNeededOnUpdate = true
    }

    func manageUserInformation() {
        guard let assembler = assembler else {
            return
        }
        let localDataSource = assembler.resolver.safelyResolve(AppData.SessionLocalDataSource.self)
        localDataSource.deleteUserInformation { _ in
            localDataSource.recordFirsLaunch()
        }
    }
}

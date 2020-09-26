//
//  CoordinatorManufacturing.swift
//  AppNavigation
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Auth
import Home

public protocol CoordinatorManufacturing {

    func makeAuthCoordinator() -> AuthCoordinator
    func makeMenuCoordinator() -> MenuCoordinator
    func makeHomeCoordinator() -> HomeCoordinator
}

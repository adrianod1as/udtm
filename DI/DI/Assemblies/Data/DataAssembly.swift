//
//  DataAssembly.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import AppData
import Domain

class DataAssembly: Assembly {

    func assemble(container: Container) {
        container.autoregister(Domain.AuthenticationRepository.self, initializer: AppData.AuthenticationRepository.init)
        container.autoregister(Domain.AccountsRepository.self, initializer: AppData.AccountsRepository.init)
    }
}

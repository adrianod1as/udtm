//
//  StorageAssembly.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import AppData
import Storage

class StorageAssembly: Assembly {

    private let service: String
    private let accessGroup: String

    init(service: String = "", accessGroup: String = "") {
        self.service = service
        self.accessGroup = accessGroup
    }

    func assemble(container: Container) {
        assembleStorage(for: container)
        assembleDatasources(for: container)
    }

    internal func assembleStorage(for container: Container) {
        container.register(AuthCredentialsStorage.self) { _ in
            AuthCredentialsStorage(service: self.service, accessGroup: self.accessGroup)
        }
        container.register(TransitoryStorage.self) { _ in
            TransitoryStorage(userDefaults: .standard)
        }
        container.register(RealmStoring.self) { _ in
            RealmStorage(group: self.accessGroup, indentifier: self.service)
        }
    }

    internal func assembleDatasources(for container: Container) {
        container.autoregister(AppData.SessionLocalDataSource.self, initializer: Storage.SessionLocalDataSource.init)
        container.autoregister(AppData.AccountLocalDatSource.self, initializer: Storage.AccountLocalDatSource.init)
    }
}

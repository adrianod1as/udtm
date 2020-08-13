//
//  SignOutLocalDataSource.swift
//  Storage
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import AppData
import Domain

public protocol SignOutLocalDataSource: AppData.SignOutLocalDataSource {

    var keychainStorage: AuthCredentialsStorage { get }
    var userDefaultsStorage: TransitoryStorage { get }
}

public extension Storage.SignOutLocalDataSource {

    func deleteUserInformation(completion: @escaping GenericCompletion<Void>) {
        if userDefaultsStorage.hasLauched {
            AuthCredentialsStorage.ValueKeyable.authenticationInfoKeys.forEach {
                try? self.keychainStorage.removeItem(keyable: $0, userId: nil, authentication: .simple)
            }
        } else {
            try? keychainStorage.removeAll()
        }
        completion(.success(()))
    }
}

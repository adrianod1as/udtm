//
//  SessionLocalDataSource.swift
//  Storage
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import AppData
import Domain

public class SessionLocalDataSource {

    public let keychainStorage: AuthCredentialsStorage
    public let userDefaultsStorage: TransitoryStorage

    public init(keychainStorage: AuthCredentialsStorage, userDefaultsStorage: TransitoryStorage) {
        self.keychainStorage = keychainStorage
        self.userDefaultsStorage = userDefaultsStorage
    }
}

extension SessionLocalDataSource: AppData.SessionLocalDataSource, Storage.SignOutLocalDataSource {

    public func select(sessionId: String, completion: @escaping GenericCompletion<Void>) {
        do {
            try self.keychainStorage.set(sessionId, keyable: .selectedSessionId, userId: nil, authentication: .simple, prompt: nil)
            completion(.success(()))
        } catch let error {
            completion(.failure(error))
        }
    }

    public func save(sessionId: String, forAccountId accountId: String, completion: @escaping GenericCompletion<Void>) {
        guard Biometrics.shared.canAuthenticate() else {
            completion(.failure(InteractionError.failedRequest(L10n.Error.Descriction.biometric)))
            return
        }
        DispatchQueue.global().async {
            do {
                try self.keychainStorage.set(sessionId, keyable: .sessionId, userId: accountId, authentication: .biometric, prompt: nil)
                DispatchQueue.main.async {
                    self.select(sessionId: sessionId, completion: completion)
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

    public func getSessionId(forAccountId accountId: String, completion: @escaping GenericCompletion<String>) {
        let biometricError = InteractionError.failedRequest(L10n.Error.Descriction.biometric)
        guard Biometrics.shared.canAuthenticate() else {
            completion(.failure(biometricError))
            return
        }
        DispatchQueue.global().async {
            do {
                guard let id = try self.keychainStorage.getString(keyable: .sessionId, userId: accountId,
                                                                  authentication: .biometric, prompt: nil) else {
                    completion(.failure(biometricError))
                    return
                }
                DispatchQueue.main.async {
                    completion(.success(id))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

    public func recordFirsLaunch() {
        userDefaultsStorage.set(true, keyable: .hasLaunched, userId: nil)
    }
}

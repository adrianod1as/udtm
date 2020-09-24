//
//  KeychainStorage.swift
//  Storage
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import KeychainAccess

public protocol KeychainStoring {

    associatedtype ValueKeyable: Keyable
    var service: String? { get }
    var accessGroup: String? { get }
    var keychain: Keychain { get }

    func set(_ value: String, keyable: ValueKeyable, userId: String?, authentication: AuthenticationType, prompt: String?) throws
    func set(_ value: Data, keyable: ValueKeyable, userId: String?, authentication: AuthenticationType, prompt: String?) throws
    func getString(keyable: ValueKeyable, userId: String?, authentication: AuthenticationType, prompt: String?) throws -> String?
    func getData(keyable: ValueKeyable, userId: String?, authentication: AuthenticationType, prompt: String?) throws -> Data?
    func removeItem(keyable: ValueKeyable, userId: String?, authentication: AuthenticationType) throws
    func removeAll() throws
}

extension KeychainStoring {

    internal func getKey(keyable: ValueKeyable, userId: String?, authentication: AuthenticationType) -> String {
        guard let userId = userId, !userId.isEmpty else {
            return "\(keyable.key)-\(authentication.key)"
        }
        return "\(userId)-\(keyable.key)-\(authentication.key)"
    }

    public var keychain: Keychain {
        if let group = accessGroup, !group.isEmpty, let service = self.service, !service.isEmpty {
            return Keychain(service: service, accessGroup: group)
        } else if let group = accessGroup, !group.isEmpty {
            return Keychain(accessGroup: group)
        } else if let service = self.service, !service.isEmpty {
            return Keychain(service: service)
        }
        return Keychain()
    }

    internal func biometricKeychain(prompt: String?) -> Keychain {
        var keychain = self.keychain.accessibility(.whenPasscodeSetThisDeviceOnly, authenticationPolicy: .userPresence)
        if let prompt = prompt, !prompt.isEmpty {
            keychain = keychain.authenticationPrompt(prompt)
        }
        return keychain
    }

    public func set(_ value: String, keyable: ValueKeyable, userId: String?,
                    authentication: AuthenticationType, prompt: String?) throws {
        let key = getKey(keyable: keyable, userId: userId, authentication: authentication)
        switch authentication {
        case .simple:
            try keychain.set(value, key: key)
        case .biometric:
            return try biometricKeychain(prompt: prompt).set(value, key: key)
        }
    }

    public func set(_ value: Data, keyable: ValueKeyable, userId: String?,
                    authentication: AuthenticationType, prompt: String?) throws {
        let key = getKey(keyable: keyable, userId: userId, authentication: authentication)
        switch authentication {
        case .simple:
            try keychain.set(value, key: key)
        case .biometric:
            return try biometricKeychain(prompt: prompt).set(value, key: key)
        }
    }

    public func getString(keyable: ValueKeyable, userId: String?,
                          authentication: AuthenticationType, prompt: String?) throws -> String? {
        let key = getKey(keyable: keyable, userId: userId, authentication: authentication)
        switch authentication {
        case .simple:
            return try keychain.get(key)
        case .biometric:
            return try biometricKeychain(prompt: prompt).get(key)
        }
    }

    public func getData(keyable: ValueKeyable, userId: String?,
                        authentication: AuthenticationType, prompt: String?) throws -> Data? {
        let key = getKey(keyable: keyable, userId: userId, authentication: authentication)
        switch authentication {
        case .simple:
            return try keychain.getData(key)
        case .biometric:
            return try biometricKeychain(prompt: prompt).getData(key)
        }
    }

    public func removeItem(keyable: ValueKeyable, userId: String?,
                           authentication: AuthenticationType) throws {
        let key = getKey(keyable: keyable, userId: userId, authentication: authentication)
        try keychain.remove(key)
    }

    public func removeAll() throws {
        return try keychain.removeAll()
    }
}

//
//  RealmStoring.swift
//  Storage
//
//  Created by Adriano Dias on 22/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import RealmSwift
import Disk

public protocol RealmStoring {

    var group: String { get }
    var indentifier: String { get }
    var key: NSData { get }
    var schemaVersion: UInt64 { get }
    var migrationBlock: MigrationBlock? { get }
    func getConfiguration(for path: String) -> Realm.Configuration
    func asRealm(forUser name: String?) -> Realm
}

extension RealmStoring {

    public var migrationBlock: MigrationBlock? {
        return { _, _ in }
    }

    public var key: NSData {
        let keychainIdentifierData = indentifier.data(using: String.Encoding.utf8, allowLossyConversion: false)!

        // First check in the keychain for an existing key
        var query: [NSString: AnyObject] = [
            kSecClass: kSecClassKey,
            kSecAttrApplicationTag: keychainIdentifierData as AnyObject,
            kSecAttrKeySizeInBits: 512 as AnyObject,
            kSecReturnData: true as AnyObject
        ]

        // To avoid Swift optimization bug, should use withUnsafeMutablePointer() function to retrieve the keychain item
        // See also: http://stackoverflow.com/questions/24145838/querying-ios-keychain-using-swift/27721328#27721328
        var dataTypeRef: AnyObject?
        var status = withUnsafeMutablePointer(to: &dataTypeRef) { SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0)) }
        if status == errSecSuccess, let data = dataTypeRef as? NSData {
            return data
        }

        // No pre-existing key from this application, so generate a new one
        let keyData = NSMutableData(length: 64)!
        let result = SecRandomCopyBytes(kSecRandomDefault, 64, keyData.mutableBytes.bindMemory(to: UInt8.self, capacity: 64))
        assert(result == 0, "Failed to get random bytes")

        // Store the key in the keychain
        query = [
            kSecClass: kSecClassKey,
            kSecAttrApplicationTag: keychainIdentifierData as AnyObject,
            kSecAttrKeySizeInBits: 512 as AnyObject,
            kSecValueData: keyData
        ]

        status = SecItemAdd(query as CFDictionary, nil)
        assert(status == errSecSuccess, "Failed to insert the new key in the keychain")

        return keyData
    }

    private func preventFileDeletion(_ path: String, in directory: Disk.Directory) {
        do {
            try Disk.doNotBackup(path, in: directory)
        } catch let erro as NSError {
            debugPrint(erro.localizedDescription)
        }
    }

    public func getConfiguration(for path: String) -> Realm.Configuration {
        let containerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: group)
        let fileURL = containerURL!.appendingPathComponent(path)
        var configuration = Realm.Configuration(fileURL: fileURL, encryptionKey: key as Data)
        configuration.schemaVersion = schemaVersion
        configuration.migrationBlock = migrationBlock
        return configuration
    }

    public func asRealm(forUser name: String?) -> Realm {
        let name = name ?? L10n.Realm.Database.defaultName
        let path = L10n.Realm.Database.path(L10n.Realm.Database.name(name))
        let realm = getConfiguration(for: path).asRealm()
        preventFileDeletion(path, in: .sharedContainer(appGroupName: group))
        return realm
    }

    var defaultRealm: Realm {
        return asRealm(forUser: nil)
    }
}

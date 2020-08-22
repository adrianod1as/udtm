//
//  Realm+Ext.swift
//  Storage
//
//  Created by Adriano Dias on 22/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import RealmSwift

extension Realm.Configuration {

    // swiftlint:disable force_try
    public func asRealm() -> Realm {
        let realm: Realm
        do {
            realm = try Realm(configuration: self)
        } catch let error as NSError {
            debugPrint(error.description)
            try! FileManager.default.removeItem(at: self.fileURL!)
            realm = try! Realm(configuration: self)

        }
        return realm
    }
}

extension List where Element: RealmCollectionValue {

    var asArray: [Element] {
        return Array(self)
    }
}

extension Object {

    static func build<O: Object>(_ builder: (O) -> Void) -> O {
        let object = O()
        builder(object)
        return object
    }
}

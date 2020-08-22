//
//  RealmStorage.swift
//  Storage
//
//  Created by Adriano Dias on 22/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import RealmSwift
import Disk

public class RealmStorage: RealmStoring {

    public let group: String
    public let indentifier: String

    var schemaVersion: UInt64 {
        return 0
    }

    public init(group: String, indentifier: String) {
        self.group = group
        self.indentifier = indentifier
    }
}

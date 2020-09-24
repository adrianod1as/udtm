//
//  RMAccoount.swift
//  Storage
//
//  Created by Adriano Dias on 09/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import RealmSwift

class RMAccoount: Object {

    @objc dynamic var id: Int = 0
    @objc dynamic var name = ""
    @objc dynamic var username = ""
    @objc dynamic var avatar = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}

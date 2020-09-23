//
//  RMAccoount.swift
//  Storage
//
//  Created by Adriano Dias on 09/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import RealmSwift

class RMAccoount: Object, Codable {

    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var username = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}

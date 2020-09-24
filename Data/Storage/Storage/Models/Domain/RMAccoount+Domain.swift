//
//  RMAccoount+Domain.swift
//  Storage
//
//  Created by Adriano Dias on 24/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain

extension RMAccoount: DomainConvertible {

    var asDomain: Account {
        Account(id: id, name: name, username: username, avatar: Gravatar(hash: avatar))
    }
}

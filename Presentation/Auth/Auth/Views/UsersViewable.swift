//
//  UsersViewable.swift
//  Auth
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Common

protocol UsersViewable: Loadable {

    func show(users: [LogableUser])
    func show(error: String)
}

//
//  UsersViewableDummy.swift
//  AuthTests
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Auth

class UsersViewableSpy: UsersViewable {

    func show(users: [LogableUser]) {}

    func show(error: String) {}

    func manage(isLoading: Bool) {}
}

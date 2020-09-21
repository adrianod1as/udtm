//
//  UsersViewableSpy.swift
//  AuthTests
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Auth

class UsersViewableSpy: UsersViewable {

    var showUsersCalled = false
    var showErrorCalled = false
    var manageIsLoadingCalled = false

    func show(users: [LogableUser]) {
        showUsersCalled.toggle()
    }

    func show(error: String) {
        showErrorCalled.toggle()
    }

    func manage(isLoading: Bool) {
        manageIsLoadingCalled.toggle()
    }
}

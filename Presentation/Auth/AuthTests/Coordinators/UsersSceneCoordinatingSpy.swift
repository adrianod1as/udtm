//
//  UsersSceneCoordinatingSpy.swift
//  AuthTests
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Auth

class UsersSceneCoordinatingSpy: UsersSceneCoordinating {

    var showNewUserCalled = false
    var showHomeCalled = false

    func showNewUser() {
        showNewUserCalled.toggle()
    }

    func showHome() {
        showHomeCalled.toggle()
    }
}

//
//  LoginSceneCoordinatingSpy.swift
//  AuthTests
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Auth

class LoginSceneCoordinatingSpy: LoginSceneCoordinating {

    var showHomeCalled = false

    func showHome() {
        showHomeCalled.toggle()
    }
}

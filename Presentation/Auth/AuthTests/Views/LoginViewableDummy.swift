//
//  LoginViewableDummy.swift
//  AuthTests
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Auth

class LoginViewableSpy: LoginViewable {

    func showGeneral(error: String) {}

    func showUser(error: String) {}

    func showPassword(error: String) {}

    func showRequestToken(url: URL) {}

    func manage(isLoading: Bool) {}

}

//
//  LoginViewableSpy.swift
//  AuthTests
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Auth

class LoginViewableSpy: LoginViewable {

    var showPasswordErrorCalled = false
    var showUserErrorCalled = false
    var showGeneralErrorCalled = false
    var manageIsLoadingCalled = false
    var showRequestTokenUrlCalled = false

    func showGeneral(error: String) {
        showGeneralErrorCalled.toggle()
    }

    func showUser(error: String) {
        showUserErrorCalled.toggle()
    }

    func showPassword(error: String) {
        showPasswordErrorCalled.toggle()
    }

    func showRequestToken(url: URL) {
        showRequestTokenUrlCalled.toggle()
    }

    func manage(isLoading: Bool) {
        manageIsLoadingCalled.toggle()
    }

}

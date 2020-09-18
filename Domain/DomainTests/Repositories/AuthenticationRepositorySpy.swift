//
//  Repositories.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Domain

class AuthenticationRepositorySpy: AuthenticationRepository {

    var createRequestTokenCalled = false
    var authenticateUserPermissionCalled = false
    var authenticateCredentialsCalled = false
    var authenticateAccountCalled = false
    var guestSessionCalled = false

    func createRequestToken(completion: @escaping GenericCompletion<RequestToken>) {
        createRequestTokenCalled.toggle()
    }

    func authenticateUserPermission(forRequestToken requestToken: String, headers: [String: String],
                                    shouldSaveSession: Bool, completion: @escaping GenericCompletion<Account>) {
        authenticateUserPermissionCalled.toggle()
    }

    func authenticateCredentials(_ credentials: Credentials, shouldSaveSession: Bool,
                                 completion: @escaping GenericCompletion<Account>) {
        authenticateCredentialsCalled.toggle()
    }

    func guestSession(completion: @escaping GenericCompletion<Void>) {
        guestSessionCalled.toggle()
    }

    func authenticateAccount(_ account: Account, completion: @escaping GenericCompletion<Void>) {
        authenticateAccountCalled.toggle()
    }

}

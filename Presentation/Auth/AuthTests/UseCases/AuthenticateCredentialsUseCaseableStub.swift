//
//  AuthenticateCredentialsUseCaseableStub.swift
//  AuthTests
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Domain

class AuthenticateCredentialsUseCaseableStub: AuthenticateCredentialsUseCaseable {

    func execute(_ credentials: Credentials, shouldSaveSession: Bool,
                 completion: @escaping GenericCompletion<Account>) {
        completion(.success(Account.getFakedItem()))
    }
}

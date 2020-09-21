//
//  AuthenticateAccountUseCaseableStub.swift
//  AuthTests
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Domain

class AuthenticateAccountUseCaseableStub: AuthenticateAccountUseCaseable {

    func execute(_ account: Account, completion: @escaping GenericCompletion<Void>) {
        completion(.success(()))
    }
}

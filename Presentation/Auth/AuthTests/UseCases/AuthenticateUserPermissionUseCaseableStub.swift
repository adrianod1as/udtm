//
//  AuthenticateUserPermissionUseCaseableStub.swift
//  AuthTests
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Domain

class AuthenticateUserPermissionUseCaseableStub: AuthenticateUserPermissionUseCaseable {

    func execute(_ requestToken: String, _ headers: [String : String],
                 shouldSaveSession: Bool, completion: @escaping GenericCompletion<Account>) {
        completion(.success(Account.getFakedItem()))
    }
}

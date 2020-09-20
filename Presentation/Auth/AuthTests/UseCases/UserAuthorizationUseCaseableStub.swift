//
//  UserAuthorizationUseCaseableStub.swift
//  AuthTests
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Domain

class UserAuthorizationUseCaseableStub: UserAuthorizationUseCaseable {

    func execute(completion: @escaping GenericCompletion<UserAuthorization>) {
        completion(.success(UserAuthorization.getFakedItem()))
    }
}

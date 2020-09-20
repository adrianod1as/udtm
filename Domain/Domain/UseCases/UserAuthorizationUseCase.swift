//
//  UserAuthorizationUseCase.swift
//  Domain
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public class UserAuthorizationUseCase {

    private let repository: AuthenticationRepository

    public init(repository: AuthenticationRepository) {
        self.repository = repository
    }
}

extension UserAuthorizationUseCase: UserAuthorizationUseCaseable {

    public func execute(completion: @escaping GenericCompletion<UserAuthorization>) {
        repository.createUserAuthorization(completion: completion)
    }
}

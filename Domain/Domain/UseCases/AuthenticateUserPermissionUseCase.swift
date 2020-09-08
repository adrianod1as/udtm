//
//  AuthenticateUserPermissionUseCase.swift
//  Domain
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

public class AuthenticateUserPermissionUseCase {

    private let repository: AuthenticationRepository

    public init(repository: AuthenticationRepository) {
        self.repository = repository
    }
}

extension AuthenticateUserPermissionUseCase: AuthenticateUserPermissionUseCaseable {

    public func execute(_ requestToken: String, _ headers: [String: String],
                        shouldSaveSession: Bool, completion: @escaping GenericCompletion<Account>) {
        repository.authenticateUserPermission(forRequestToken: requestToken, headers: headers, shouldSaveSession: shouldSaveSession, completion: completion)
    }
}

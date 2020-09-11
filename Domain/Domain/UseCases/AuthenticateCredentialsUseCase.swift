//
//  AuthenticateCredentialsUseCase.swift
//  Domain
//
//  Created by Adriano Dias on 08/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public class AuthenticateCredentialsUseCase {
    
    private let repository: AuthenticationRepository

    public init(repository: AuthenticationRepository) {
        self.repository = repository
    }
}

extension AuthenticateCredentialsUseCase: AuthenticateCredentialsUseCaseable {

    public func execute(_ credentials: Credentials, shouldSaveSession: Bool,
                        completion: @escaping GenericCompletion<Account>) {
        guard credentials.isValid else {
            credentials.failures.forEach { completion(.failure($0)) }
            return
        }
        repository.authenticateCredentials(credentials, shouldSaveSession: shouldSaveSession, completion: completion)
    }
}

//
//  AuthenticateAccountUseCase.swift
//  Domain
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public class AuthenticateAccountUseCase {

    private let repository: AuthenticationRepository

    public init(repository: AuthenticationRepository) {
        self.repository = repository
    }
}

extension AuthenticateAccountUseCase: AuthenticateAccountUseCaseable {

    public func execute(_ account: Account, completion: @escaping GenericCompletion<Void>) {
        switch account.idValidation {
        case .success:
            repository.authenticateAccount(account, completion: completion)
        case .failure(let error):
            completion(.failure(error))
        }

    }
}


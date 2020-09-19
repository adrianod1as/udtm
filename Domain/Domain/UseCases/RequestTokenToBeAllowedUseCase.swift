//
//  RequestTokenToBeAllowedUseCase.swift
//  Domain
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public class RequestTokenToBeAllowedUseCase {

    private let repository: AuthenticationRepository

    public init(repository: AuthenticationRepository) {
        self.repository = repository
    }
}

extension RequestTokenToBeAllowedUseCase: RequestTokenToBeAllowedUseCaseable {

    public func execute(completion: @escaping GenericCompletion<RequestTokenToBeAllowedByUser>) {
        repository.createRequestTokenToBeAllowedByUser(completion: completion)
    }
}

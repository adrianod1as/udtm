//
//  GuestSessionUseCaseableCase.swift
//  Domain
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public class GuestSessionUseCase {

    private let repository: AuthenticationRepository

    public init(repository: AuthenticationRepository) {
        self.repository = repository
    }
}

extension GuestSessionUseCase: GuestSessionUseCaseableCaseable {

    public func execute(completion: @escaping GenericCompletion<Void>) {
        repository.guestSession(completion: completion)
    }
}

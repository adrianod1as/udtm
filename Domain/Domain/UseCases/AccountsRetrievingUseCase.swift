//
//  AccountsRetrievingUseCase.swift
//  Domain
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public class AccountsRetrievingUseCase {

    private let repository: AccountsRepository

    public init(repository: AccountsRepository) {
        self.repository = repository
    }
}

extension AccountsRetrievingUseCase: AccountsRetrievingUseCaseable {

    public func execute(completion: @escaping GenericCompletion<[Account]>) {
        repository.getAccounts(completion: completion)
    }
}

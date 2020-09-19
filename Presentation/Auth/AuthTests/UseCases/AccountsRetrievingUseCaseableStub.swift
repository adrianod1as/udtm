//
//  AccountsRetrievingUseCaseableStub.swift
//  AuthTests
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Domain

class AccountsRetrievingUseCaseableStub: AccountsRetrievingUseCaseable {

    func execute(completion: @escaping GenericCompletion<[Account]>) {
        completion(.success(Account.getFakedArray(amount: 4)))
    }
}

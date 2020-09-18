//
//  AccountsRepositorySpy.swift
//  DomainTests
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Domain

class AccountsRepositorySpy: AccountsRepository {

    var getAccounts = false

    func getAccounts(completion: @escaping GenericCompletion<[Account]>) {
        getAccounts.toggle()
    }

}

//
//  AccountsRepository.swift
//  AppData
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain

public class AccountsRepository {

    internal let accountLocalDataSource: AccountLocalDatSource

    public init(accountLocalDataSource: AccountLocalDatSource) {
        self.accountLocalDataSource = accountLocalDataSource
    }
}

extension AccountsRepository: Domain.AccountsRepository {

    public func getAccounts(completion: @escaping GenericCompletion<[Account]>) {
        accountLocalDataSource.getAccounts(completion: completion)
    }
}

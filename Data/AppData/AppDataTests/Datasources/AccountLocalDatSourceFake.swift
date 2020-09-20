//
//  AccountLocalDatSourceFake.swift
//  AppDataTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Domain
@testable import AppData

class AccountLocalDatSourceFake: AccountLocalDatSource {

    var saveAccountResult: Result<Void, Error> = .success(())
    var getAccountResult: Result<Account, Error> = .success(Account.getFakedItem())
    var getAccountsResult: Result<[Account], Error> = .success(Account.getFakedArray(amount: 4))

    func save(account: Account, completion: @escaping GenericCompletion<Void>) {
        completion(saveAccountResult)
    }

    func getAccount(for id: String, completion: @escaping GenericCompletion<Account>) {
        completion(getAccountResult)
    }

    func getAccounts(completion: @escaping GenericCompletion<[Account]>) {
        completion(getAccountsResult)
    }
}

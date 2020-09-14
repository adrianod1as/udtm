//
//  AccountRemoteDataSourceFake.swift
//  AppDataTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Domain
@testable import AppData

class AccountRemoteDataSourceFake: AccountRemoteDataSource {

    var getAccountResult: Result<Account, Error> = .success(Account.getFakedItem())

    func getAccount(forSession id: String, completion: @escaping GenericCompletion<Account>) {
        completion(getAccountResult)
    }
}

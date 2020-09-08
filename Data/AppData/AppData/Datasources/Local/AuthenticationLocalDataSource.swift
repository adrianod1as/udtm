//
//  AuthenticationLocalDataSource.swift
//  AppData
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain

public protocol AuthenticationLocalDataSource: SessionLocalDataSource {

    func save(account: Account, completion: @escaping GenericCompletion<Void>)
    func getAccount(completion: @escaping GenericCompletion<Account>)
}

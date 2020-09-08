//
//  AccountRemoteDataSource.swift
//  AppData
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain

public protocol AccountRemoteDataSource: AnyObject {

    func getAccount(forSession id: String, completion: @escaping GenericCompletion<Account>)
    func getAccountForCurrentSession(completion: @escaping GenericCompletion<Account>)
}

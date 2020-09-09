//
//  AccountLocalDatSource.swift
//  AppData
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain

public protocol AccountLocalDatSource: AnyObject {

    func save(account: Account, completion: @escaping GenericCompletion<Void>)
    func getAccount(for id: String, completion: @escaping GenericCompletion<Account>)
}

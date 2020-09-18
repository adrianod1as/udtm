//
//  AccountsRepository.swift
//  Domain
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public protocol AccountsRepository {

    func getAccounts(completion: @escaping GenericCompletion<[Account]>)
}

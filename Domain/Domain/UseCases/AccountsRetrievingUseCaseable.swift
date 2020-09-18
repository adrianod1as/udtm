//
//  AccountsRetrievingUseCaseable.swift
//  Domain
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public protocol AccountsRetrievingUseCaseable: AnyObject {

    func execute(completion: @escaping GenericCompletion<[Account]>)
}


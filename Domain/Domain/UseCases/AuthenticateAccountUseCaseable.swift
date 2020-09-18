//
//  AuthenticateAccountUseCaseable.swift
//  Domain
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public protocol AuthenticateAccountUseCaseable: AnyObject {

    func execute(_ account: Account, completion: @escaping GenericCompletion<Void>)
}

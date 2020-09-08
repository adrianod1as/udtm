//
//  AuthenticateCredentialsUseCaseable.swift
//  Domain
//
//  Created by Adriano Dias on 02/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public protocol AuthenticateCredentialsUseCaseable: AnyObject {

    func execute(_ credentials: Credentials, completion: @escaping GenericCompletion<Account>)
}

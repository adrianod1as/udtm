//
//  AuthenticationRepository.swift
//  Domain
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

public protocol AuthenticationRepository {

    func createRequestToken(completion: @escaping GenericCompletion<String>)
    func authenticateUserPermission(forRequestToken requestToken: String, headers: [String: String],
                                    completion: @escaping GenericCompletion<Account>)
    func authenticateCredentials(_ credentials: Credentials, completion: @escaping GenericCompletion<Account>)
}

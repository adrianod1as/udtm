//
//  AuthenticationRepository.swift
//  Domain
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

public protocol AuthenticationRepository {

    func createRequestToken(completion: @escaping GenericCompletion<RequestToken>)
    func createRequestTokenToBeAllowedByUser(completion: @escaping GenericCompletion<RequestTokenToBeAllowedByUser>)
    func authenticateUserPermission(forRequestToken requestToken: String,
                                    headers: [String: String], shouldSaveSession: Bool,
                                    completion: @escaping GenericCompletion<Account>)
    func authenticateCredentials(_ credentials: Credentials, shouldSaveSession: Bool,
                                 completion: @escaping GenericCompletion<Account>)
    func authenticateAccount(_ account: Account, completion: @escaping GenericCompletion<Void>)
    func guestSession(completion: @escaping GenericCompletion<Void>)
}

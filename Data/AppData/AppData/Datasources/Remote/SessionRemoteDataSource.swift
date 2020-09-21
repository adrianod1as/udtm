//
//  SessionRemoteDataSource.swift
//  AppData
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain

public protocol SessionRemoteDataSource: AnyObject {

    func createGuestSession(completion: @escaping GenericCompletion<GuestSession>)
    func createRequestToken(completion: @escaping GenericCompletion<RequestToken>)
    func createUserAuthorization(completion: @escaping GenericCompletion<UserAuthorization>)
    func createSession(forAuthenticatedRequestToken requestToken: String,
                       completion: @escaping GenericCompletion<UserSession>)
    func createSession(forRequestToken requestToken: String, checkingPermissionFromHeaders headers: [String: String],
                       completion: @escaping GenericCompletion<UserSession>)
    func createSession(forCredentials credentials: Credentials, completion: @escaping GenericCompletion<UserSession>)
}

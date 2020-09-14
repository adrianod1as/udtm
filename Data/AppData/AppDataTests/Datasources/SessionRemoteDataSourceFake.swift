//
//  SessionRemoteDataSourceFake.swift
//  AppDataTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Domain
@testable import AppData

class SessionRemoteDataSourceFake: SessionRemoteDataSource {

    var createRequestTokenResult: Result<RequestToken, Error> = .success(RequestToken.getFakedItem())
    var createSessionForRequestTokenResult: Result<UserSession, Error> = .success(UserSession.getFakedItem())
    var createSessionForCredentialsTokenResult: Result<UserSession, Error> = .success(UserSession.getFakedItem())

    func createRequestToken(completion: @escaping GenericCompletion<RequestToken>) {
        completion(createRequestTokenResult)
    }

    func createSession(forAuthenticatedRequestToken requestToken: String,
                       completion: @escaping GenericCompletion<UserSession>) {
        completion(createSessionForRequestTokenResult)
    }

    func createSession(forRequestToken requestToken: String,
                       checkingPermissionFromHeaders headers: [String: String],
                       completion: @escaping GenericCompletion<UserSession>) {
        createSession(forAuthenticatedRequestToken: requestToken, completion: completion)
    }

    func createSession(forCredentials credentials: Credentials, completion: @escaping GenericCompletion<UserSession>) {
        completion(createSessionForCredentialsTokenResult)
    }
}

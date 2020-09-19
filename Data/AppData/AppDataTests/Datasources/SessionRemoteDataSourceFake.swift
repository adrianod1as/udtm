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
    var createRequestTokenToBeAllowedByUser = Result<RequestTokenToBeAllowedByUser, Error>
                                                .success((RequestToken.getFakedItem().code,
                                                          URL(string: "https://www.apple.com/")!))
    var createSessionForRequestTokenResult: Result<UserSession, Error> = .success(UserSession.getFakedItem())
    var createSessionForCredentialsTokenResult: Result<UserSession, Error> = .success(UserSession.getFakedItem())
    var createGuestSession: Result<GuestSession, Error> = .success(GuestSession.getFakedItem())

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

    func createGuestSession(completion: @escaping GenericCompletion<GuestSession>) {
        completion(createGuestSession)
    }

    func createRequestTokenToBeAllowedByUser(completion: @escaping GenericCompletion<RequestTokenToBeAllowedByUser>) {
        completion(createRequestTokenToBeAllowedByUser)
    }

}

//
//  SessionRemoteDataSource.swift
//  Networking
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import AppData
import Domain
import OxeNetworking

public class SessionRemoteDataSource {

    private let dispatcher: Dispatcher

    public init(dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
    }
}

extension SessionRemoteDataSource: AppData.SessionRemoteDataSource {

    public func createUserAuthorization(completion: @escaping GenericCompletion<UserAuthorization>) {
        createRequestToken { result in
            switch result {
            case .success(let token):
                self.createUserAuthorization(with: token, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    internal func createUserAuthorization(with requesToken: RequestToken,
                                          completion: @escaping GenericCompletion<UserAuthorization>) {
        guard let requestTokenToBeAllowedByUser = requesToken.asUserAuthorization else {
            completion(.failure(InteractionError.failedRequest(L10n.Error.Description.Token.url)))
            return
        }
        completion(.success(requestTokenToBeAllowedByUser))
    }

    public func createGuestSession(completion: @escaping GenericCompletion<GuestSession>) {
        dispatcher.getDecodable(GuestSession.self, from: AuthenticationTarget.guestSession, completion: completion)
    }

    public func createSession(forAuthenticatedRequestToken requestToken: String, completion: @escaping GenericCompletion<UserSession>) {
        dispatcher.getDecodable(UserSession.self, from: AuthenticationTarget.createSessionForRequestToken(requestToken), completion: completion)
    }

    public func createRequestToken(completion: @escaping GenericCompletion<RequestToken>) {
        dispatcher.getDecodable(RequestToken.self, from: AuthenticationTarget.requestToken, completion: completion)
    }

    public func createSession(forRequestToken requestToken: String,
                              checkingPermissionFromHeaders headers: [String: String],
                              completion: @escaping GenericCompletion<UserSession>) {
        guard headers.hasUserAuthenticatedToken else {
            completion(.failure(InteractionError.failedRequest(L10n.Error.Description.Token.authentication)))
            return
        }
        createSession(forAuthenticatedRequestToken: requestToken, completion: completion)
    }

    public func createSession(forCredentials credentials: Credentials, completion: @escaping GenericCompletion<UserSession>) {
        createRequestToken(forCredentials: credentials) { result in
            switch result {
            case .success(let token):
                self.createSession(forAuthenticatedRequestToken: token.code, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    internal func createRequestToken(forCredentials credentials: Credentials,
                                     completion: @escaping GenericCompletion<RequestToken>) {
        dispatcher.getDecodable(RequestToken.self,
                                from: AuthenticationTarget.authenticateTokenWithCredentials(credentials),
                                completion: completion)
    }
}

extension Dictionary where Key == String, Value == String {

    internal var hasUserAuthenticatedToken: Bool {
        return !self.isEmpty
    }
}

extension RequestToken {

    internal var asUserAuthorization: UserAuthorization? {
        guard let url = URL(string: L10n.RequestToken.Permission.url(code)) else {
            return nil
        }
        return UserAuthorization(requestToken: code, allowingURL: url)
    }
}

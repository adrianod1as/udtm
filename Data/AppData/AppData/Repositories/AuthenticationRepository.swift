//
//  AuthenticationRepository.swift
//  AppData
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain

public class AuthenticationRepository {

    internal let authLocalDataSource: SessionLocalDataSource
    internal let accountLocalDataSource: AccountLocalDatSource
    internal let authRemoteDataSource: SessionRemoteDataSource
    internal let accountRemoteDataSource: AccountRemoteDataSource

    public init(authLocalDataSource: SessionLocalDataSource,
                accountLocalDataSource: AccountLocalDatSource,
                authRemoteDataSource: SessionRemoteDataSource,
                accountRemoteDataSource: AccountRemoteDataSource) {
        self.authLocalDataSource = authLocalDataSource
        self.accountLocalDataSource = accountLocalDataSource
        self.authRemoteDataSource = authRemoteDataSource
        self.accountRemoteDataSource = accountRemoteDataSource
    }
}

extension AuthenticationRepository: Domain.AuthenticationRepository, AppData.SignOutRepository {

    public var signOutLocalDataSource: SignOutLocalDataSource {
        authLocalDataSource
    }

    public func createUserAuthorization(completion: @escaping GenericCompletion<UserAuthorization>) {
        authRemoteDataSource.createUserAuthorization(completion: completion)
    }

    public func guestSession(completion: @escaping GenericCompletion<Void>) {
        authRemoteDataSource.createGuestSession { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public func createRequestToken(completion: @escaping GenericCompletion<RequestToken>) {
        authRemoteDataSource.createRequestToken(completion: completion)
    }

    public func authenticateCredentials(_ credentials: Credentials, shouldSaveSession: Bool,
                                        completion: @escaping GenericCompletion<Account>) {
        createRequestToken { result in
            switch result {
            case .success(let requestToken):
                self.authenticate(credentials: credentials, with: requestToken.code,
                                  shouldSaveSession: shouldSaveSession, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    internal func authenticate(credentials: Credentials,
                               with requestToken: String, shouldSaveSession: Bool,
                               completion: @escaping GenericCompletion<Account>) {
        authRemoteDataSource.createSession(forCredentials: credentials.setting(requestToken: requestToken)) { result in
            switch result {
            case .success(let session):
                self.getAccount(forSessionId: session.id, shouldSaveSession: shouldSaveSession, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public func authenticateUserPermission(forRequestToken requestToken: String,
                                           headers: [String: String], shouldSaveSession: Bool,
                                           completion: @escaping GenericCompletion<Account>) {
        authRemoteDataSource.createSession(forRequestToken: requestToken,
                                          checkingPermissionFromHeaders: headers) { result in
            switch result {
            case .success(let session):
                self.getAccount(forSessionId: session.id, shouldSaveSession: shouldSaveSession, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    internal func getAccount(forSessionId sessionId: String, shouldSaveSession: Bool,
                             completion: @escaping GenericCompletion<Account>) {
        accountRemoteDataSource.getAccount(forSession: sessionId) { result in
            switch result {
            case .success(let account):
                self.save(account: account, forSessionId: sessionId,
                          shouldSaveSession: shouldSaveSession, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    internal func save(account: Account,
                       forSessionId sessionId: String, shouldSaveSession: Bool,
                       completion: @escaping GenericCompletion<Account>) {
        accountLocalDataSource.save(account: account) { result in
            switch result {
            case .success:
                guard shouldSaveSession else {
                    completion(.success(account))
                    return
                }
                self.save(sessionId: sessionId, forAccount: account, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    internal func save(sessionId: String, forAccount account: Account,
                       completion: @escaping GenericCompletion<Account>) {
        authLocalDataSource.save(sessionId: sessionId, forAccountId: account.id.description) { result in
            switch result {
            case .success:
                completion(.success(account))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public func authenticateAccount(_ account: Account, completion: @escaping GenericCompletion<Void>) {
        authLocalDataSource.getSessionId(forAccountId: account.id.description) { result in
            switch result {
            case .success(let id):
                self.authLocalDataSource.select(sessionId: id, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

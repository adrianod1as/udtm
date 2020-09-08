//
//  AuthenticationRepository.swift
//  AppData
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain

public class AuthenticationRepository {

    private let authLocalDatSource: AuthenticationLocalDataSource
    private let authRemoteDatSource: SessionRemoteDataSource
    private let accountRemoteDataSource: AccountRemoteDataSource

    public init(localDatSource: AuthenticationLocalDataSource,
                remoteDatSource: SessionRemoteDataSource,
                accountRemoteDataSource: AccountRemoteDataSource) {
        self.authLocalDatSource = localDatSource
        self.authRemoteDatSource = remoteDatSource
        self.accountRemoteDataSource = accountRemoteDataSource
    }
}

extension AuthenticationRepository: Domain.AuthenticationRepository {

    public func createRequestToken(completion: @escaping GenericCompletion<String>) {
        authRemoteDatSource.createRequestToken(completion: completion)
    }

    public func authenticateCredentials(_ credentials: Credentials, shouldSaveSession: Bool,
                                        completion: @escaping GenericCompletion<Account>) {
        createRequestToken { result in
            switch result {
            case .success(let requestToken):
                self.authenticate(credentials: credentials, with: requestToken,
                                  shouldSaveSession: shouldSaveSession, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func authenticate(credentials: Credentials, with requestToken: String,
                              shouldSaveSession: Bool, completion: @escaping GenericCompletion<Account>) {
        authRemoteDatSource.createSession(forCredentials: credentials.setting(requestToken: requestToken)) { result in
            switch result {
            case .success(let id):
                self.getAccount(forSessionId: id, shouldSaveSession: shouldSaveSession, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public func authenticateUserPermission(forRequestToken requestToken: String,
                                           headers: [String : String], shouldSaveSession: Bool,
                                           completion: @escaping GenericCompletion<Account>) {
        authRemoteDatSource.createSession(forRequestToken: requestToken, checkingPermissionFromHeaders: headers) { result in
            switch result {
            case .success(let id):
                self.getAccount(forSessionId: id, shouldSaveSession: shouldSaveSession, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func getAccount(forSessionId sessionId: String, shouldSaveSession: Bool,
                            completion: @escaping GenericCompletion<Account>) {
        accountRemoteDataSource.getAccount(forSession: sessionId) { result in
            switch result {
            case .success(let account):
                self.save(sessionId: sessionId, forAccount: account, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func save(sessionId: String, forAccount account: Account, completion: @escaping GenericCompletion<Account>) {
        authLocalDatSource.save(sessionId: sessionId, forAccountId: account.id) { result in
            switch result {
            case .success:
                completion(.success(account))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

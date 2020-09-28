//
//  SessionLocalDataSourceFake.swift
//  AppDataTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Domain
@testable import AppData

class SessionLocalDataSourceFake: SessionLocalDataSource {

    var saveSessionIdResult: Result<Void, Error> = .success(())
    var getSessionIdResult: Result<String, Error> = .success(UserSession.getFakedItem().id)
    var selectSessionIdResult: Result<Void, Error> = .success(())
    var deleteUserInformationResult: Result<Void, Error> = .success(())

    func save(sessionId: String, forAccountId accountId: String, completion: @escaping GenericCompletion<Void>) {
        completion(saveSessionIdResult)
    }

    func getSessionId(forAccountId accountId: String, completion: @escaping GenericCompletion<String>) {
        completion(getSessionIdResult)
    }

    func select(sessionId: String, completion: @escaping GenericCompletion<Void>) {
        completion(selectSessionIdResult)
    }

    func recordFirsLaunch() {}

    func deleteUserInformation(completion: @escaping GenericCompletion<Void>) {
        completion(deleteUserInformationResult)
    }
}

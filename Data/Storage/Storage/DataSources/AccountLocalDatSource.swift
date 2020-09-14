//
//  AccountLocalDatSource.swift
//  Storage
//
//  Created by Adriano Dias on 09/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import AppData
import Domain

public class AccountLocalDatSource {

    private let realmStorage: RealmStoring

    public init(realmStorage: RealmStoring) {
        self.realmStorage = realmStorage
    }
}

extension AccountLocalDatSource: AppData.AccountLocalDatSource {

    public func save(account: Account, completion: @escaping GenericCompletion<Void>) {
        let realm = realmStorage.defaultRealm
        do {
            try realm.write {
                realm.create(RMAccoount.self, value: account.rawObject ?? [:], update: .modified)
                completion(.success(()))
            }
        } catch {
            completion(.failure(error))
        }
    }

    public func getAccount(for id: String, completion: @escaping GenericCompletion<Account>) {
        guard let account = realmStorage.defaultRealm.object(ofType: RMAccoount.self, forPrimaryKey: id) else {
            completion(.failure(InteractionError.failedRequest("")))
            return
        }
        completion(.success(account.asDomain()))
    }
}

//
//  AccountRemoteDataSource.swift
//  Networking
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain
import AppData
import OxeNetworking

public class AccountRemoteDataSource {

    private let dispatcher: Dispatcher

    public init(dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
    }
}

extension AccountRemoteDataSource: AppData.AccountRemoteDataSource {

    public func getAccount(forSession id: String, completion: @escaping GenericCompletion<Account>) {
        dispatcher.getDecodable(Account.self, from: AccountTarget.accountDetails(sessionId: id), completion: completion)
    }

}

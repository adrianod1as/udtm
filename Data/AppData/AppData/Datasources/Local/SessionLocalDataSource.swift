//
//  SessionLocalDataSource.swift
//  AppData
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain

public protocol SessionLocalDataSource: AnyObject {

    func save(sessionId: String, forAccountId accountId: String, completion: @escaping GenericCompletion<Void>)
    func getSessionId(forAccountId accountId: String, completion: @escaping GenericCompletion<String>)
}

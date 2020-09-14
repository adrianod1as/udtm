//
//  AuthenticateUserPermissionUseCaseable.swift
//  Domain
//
//  Created by Adriano Dias on 23/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

public protocol AuthenticateUserPermissionUseCaseable: AnyObject {

    func execute(_ requestToken: String,
                 _ headers: [String: String], shouldSaveSession: Bool,
                 completion: @escaping GenericCompletion<Account>)
}

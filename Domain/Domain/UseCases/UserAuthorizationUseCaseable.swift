//
//  UserAuthorizationUseCaseable.swift
//  Domain
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public protocol UserAuthorizationUseCaseable: AnyObject {

    func execute(completion: @escaping GenericCompletion<UserAuthorization>)
}

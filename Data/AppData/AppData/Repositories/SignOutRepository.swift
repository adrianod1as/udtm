//
//  SignOutRepository.swift
//  AppData
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import Domain

public protocol SignOutLocalDataSource {

    func deleteUserInformation(completion: @escaping GenericCompletion<Void>)
}

public protocol SignOutRepository: Domain.SignOutRepository {

    var signOutLocalDataSource: SignOutLocalDataSource { get }
}

extension AppData.SignOutRepository {

    public func signOut(completion: @escaping GenericCompletion<Void>) {
        signOutLocalDataSource.deleteUserInformation(completion: completion)
    }
}

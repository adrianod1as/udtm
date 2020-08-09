//
//  SignOutRepository.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public protocol SignOutRepository {

    func signOut(completion: @escaping GenericCompletion<Void>)
}

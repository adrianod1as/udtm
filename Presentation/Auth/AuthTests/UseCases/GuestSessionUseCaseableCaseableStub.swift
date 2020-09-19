//
//  GuestSessionUseCaseableCaseableStub.swift
//  AuthTests
//
//  Created by Adriano Dias on 19/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Domain

class GuestSessionUseCaseableStub: GuestSessionUseCaseable {

    func execute(completion: @escaping GenericCompletion<Void>) {
        completion(.success(()))
    }

}

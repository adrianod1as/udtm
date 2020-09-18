//
//  GuestSessionUseCaseable.swift
//  Domain
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public protocol GuestSessionUseCaseableCaseable: AnyObject {

    func execute(completion: @escaping GenericCompletion<Void>)
}

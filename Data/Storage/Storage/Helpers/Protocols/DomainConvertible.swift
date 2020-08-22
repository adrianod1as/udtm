//
//  DomainConvertible.swift
//  Storage
//
//  Created by Adriano Dias on 22/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

public protocol DomainConvertible {

    associatedtype DomainType

    func asDomain() -> DomainType
}

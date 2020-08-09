//
//  DomainConvertibleType.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public protocol DomainConvertibleType {

    associatedtype DomainType

    func asDomain() -> DomainType
}

//
//  DomainConvertible.swift
//  Storage
//
//  Created by Adriano Dias on 22/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Domain

public protocol DomainConvertible {

    associatedtype DomainType: Codable

    func asDomain() -> DomainType
}

extension DomainConvertible where Self: Codable {

    func asDomain() -> DomainType {
        guard let data = self.data, let model = data.decode(DomainType.self) else {
            fatalError()
        }
        return model
    }
}

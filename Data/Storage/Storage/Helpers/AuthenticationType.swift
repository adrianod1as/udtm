//
//  AuthenticationType.swift
//  Storage
//
//  Created by Adriano Dias on 22/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

public enum AuthenticationType: String, CaseIterable {
    case simple
    case biometric

    var key: String {
        return rawValue
    }
}

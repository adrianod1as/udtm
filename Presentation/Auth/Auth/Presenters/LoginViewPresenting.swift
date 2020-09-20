//
//  LoginPresentable.swift
//  Auth
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public protocol LoginViewPresenting: AnyObject {

    func authenticate(user: String, password: String, savingSession: Bool)
    func requestToken()
    func authenticate(headers: [String: String], savingSession: Bool)
}

//
//  UsersPresentable.swift
//  Auth
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

public protocol UsersPresentable: AnyObject {

    func getUsers()
    func select(user: LogableUser)
}

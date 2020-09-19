//
//  LoginViewable.swift
//  Auth
//
//  Created by Adriano Dias on 18/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Common

protocol LoginViewable: Loadable {

    func showGeneral(error: String)
    func showUser(error: String)
    func showPassword(error: String)
    func showRequestToken(url: URL)
}

//
//  DomainAssembly.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import Domain

class DomainAssembly: Assembly {

    func assemble(container: Container) {
        container.autoregister(AuthenticateUserPermissionUseCaseable.self,
                               initializer: AuthenticateUserPermissionUseCase.init)
        container.autoregister(AuthenticateCredentialsUseCaseable.self,
                               initializer: AuthenticateCredentialsUseCase.init)
        container.autoregister(AccountsRetrievingUseCaseable.self,
                               initializer: AccountsRetrievingUseCase.init)
        container.autoregister(GuestSessionUseCaseable.self,
                               initializer: GuestSessionUseCase.init)
        container.autoregister(AuthenticateAccountUseCaseable.self,
                               initializer: AuthenticateAccountUseCase.init)
        container.autoregister(UserAuthorizationUseCaseable.self,
                               initializer: UserAuthorizationUseCase.init)
    }
}

//
//  NetworkingAssembly.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import Networking
import OxeNetworking
import Alamofire
import AppData

class NetworkingAssembly: Assembly {

    private let environment: Environment

    init(environment: Environment) {
        self.environment = environment
    }

    func assemble(container: Container) {
        container.register(Environment.self) { _ in self.environment }
        container.autoregister(UserSessionRequestHandler.self, initializer: UserSessionRequestHandler.init)
                    .implements(ResultHandler.self, RequestInterceptor.self, ErrorFilter.self)
        container.autoregister(Dispatcher.self, initializer: CommonMoyaDispatcher.init)
    }

}

//
//  CoordinatorFactory.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import AppNavigation

public class CoordinatorFactory: CoordinatorManufacturing, DependencyManufacturing {

    private let resolver: Resolver

    public required init(resolver: Resolver) {
        self.resolver = resolver
    }

}

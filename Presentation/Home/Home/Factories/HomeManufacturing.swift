//
//  HomeManufacturing.swift
//  Home
//
//  Created by Adriano Dias on 24/09/20.
//

import UIKit
import Common

public protocol HomeManufacturing {

    func makeHomeNavigationController() -> UINavigationController
    func makeHomeViewController() -> HomeViewController
}

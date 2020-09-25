//
//  HomePresenter.swift
//  Home
//
//  Created by Adriano Dias on 24/09/20.
//

import Domain

protocol HomePresenterHolding {

    var view: HomeViewable? { get set }
    var coordinator: HomeSceneCoordinating { get }
    init(coordinator: HomeSceneCoordinating)
    func attach(view: HomeViewable)
}

public class HomePresenter: HomePresenterHolding {

    internal var view: HomeViewable?
    internal let coordinator: HomeSceneCoordinating

    public required init(coordinator: HomeSceneCoordinating) {
        self.coordinator = coordinator
    }

    public func attach(view: HomeViewable) {
        self.view = view
    }

}

extension HomePresenter: HomeViewPresenting {

}

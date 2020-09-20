//
//  UsersViewController.swift
//  Auth
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

public class UsersViewController: UIViewController {

    // MARK: Properties
    private lazy var usersView = UsersView()
    private let presenter: UsersViewPresenting

    // MARK: Init
    public init(presenter: UsersViewPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    public override func loadView() {
        view = usersView
        usersView.delegate = self
    }
}

// MARK: UsersViewDelegate
extension UsersViewController: UsersViewDelegate {

}

// MARK: UsersViewable
extension UsersViewController: UsersViewable {

    public func show(users: [LogableUser]) {
    }

    public func show(error: String) {
    }

    public func manage(isLoading: Bool) {
    }

}

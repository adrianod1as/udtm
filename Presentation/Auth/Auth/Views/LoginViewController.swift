//
//  LoginViewController.swift
//  Auth
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

public class LoginViewController: UIViewController {

    // MARK: Properties
    private lazy var usersView = LoginView()
    private let presenter: LoginViewPresenting

    // MARK: Init
    public init(presenter: LoginViewPresenting) {
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

// MARK: LoginViewDelegate
extension LoginViewController: LoginViewDelegate {

}

// MARK: LoginViewable
extension LoginViewController: LoginViewable {

    public func showGeneral(error: String) {

    }

    public func showUser(error: String) {

    }

    public func showPassword(error: String) {

    }

    public func showRequestToken(url: URL) {

    }

    public func manage(isLoading: Bool) {

    }
}
